using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using AzureStorage.StorageContract;
using Microsoft.WindowsAzure.StorageClient;
using Microsoft.WindowsAzure;
using System.Web.Script.Serialization;
using AzureStorage.Extensions;
namespace AzureStorage.Storage
{
public class AzureQueue<T> : IAzureQueue<T> where T : AzureQueueMessage
{
    private readonly CloudQueue queue;
    private readonly CloudQueueClient queueClient;
    private readonly string queueName;

    public AzureQueue(CloudStorageAccount account)
        : this(account, typeof(T).Name.ToLowerInvariant())
    {
    }

    public AzureQueue(CloudStorageAccount account, string queueName)
    {
        if (account == null)
        {
            throw new ArgumentNullException("account");
        }
        this.queueName=queueName;
        queueClient = account.CreateCloudQueueClient();
        this.queue = queueClient.GetQueueReference(queueName);
        this.queue.CreateIfNotExist();
    }

    public void AddMessage(T message)
    {
        this.queue.AddMessage(message.AsMessage());        
    }

    public T GetMessage()
    {
        return this.GetMessageInternal(null);
    }

    public T GetMessage(TimeSpan timeout)
    {
        return this.GetMessageInternal(timeout);
    }

    public IEnumerable<T> GetMessages(int maxMessagesToReturn)
    {
        var messages = this.queue.GetMessages(maxMessagesToReturn);

        foreach (var message in messages)
        {
            yield return GetDeserializedMessage(message);
        }
    }

    public void EnsureExist()
    {
        this.queue.CreateIfNotExist();
    }

    public void Clear()
    {
        this.queue.Clear();
    }
    public void DeleteMessage(T message)
    {
        this.queue.DeleteMessage(message.Id, message.PopReceipt);
    }
    public void DeleteMessage(CloudQueueMessage message)
    {
        this.queue.DeleteMessage(message);
    }
    public void DeleteQueue()
    {
        this.queue.Delete();
    }

    private static T GetDeserializedMessage(CloudQueueMessage message)
    {
        var deserializedMessage= message.Payload<T>();
        deserializedMessage.Id = message.Id;
        deserializedMessage.PopReceipt = message.PopReceipt;
        deserializedMessage.DequeueCount = message.DequeueCount;
        deserializedMessage.InsertionTime = message.InsertionTime;
        deserializedMessage.ExpirationTime = message.ExpirationTime;
        return deserializedMessage;
    }

    private T GetMessageInternal(TimeSpan? timeout)
    {
        CloudQueueMessage message;
        if (timeout.HasValue)
        {
            message = this.queue.GetMessage(timeout.Value);
        }
        else
        {
            message = this.queue.GetMessage();
        }

        if (message == null)
        {
            return default(T);
        }

        return GetDeserializedMessage(message);
    }
    public int ApproximateMessageCount
    {
        get
        {
            CloudQueue queueRef = queueClient.GetQueueReference(queueName);
            queueRef.RetrieveApproximateMessageCount();
            if (queueRef.ApproximateMessageCount.HasValue)
            {
                return queueRef.ApproximateMessageCount.Value;
            }
            return 0;
        }
    }
}
}
