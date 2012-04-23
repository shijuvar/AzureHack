using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Microsoft.WindowsAzure.StorageClient;

namespace AzureStorage.StorageContract
{
public interface IAzureQueue<T> where T : AzureQueueMessage
{
    void EnsureExist();
    void Clear();
    void AddMessage(T message);
    T GetMessage();
    T GetMessage(TimeSpan timeout);
    IEnumerable<T> GetMessages(int maxMessagesToReturn);
    void DeleteMessage(T message);
    void DeleteMessage(CloudQueueMessage message);
    void DeleteQueue();
    int ApproximateMessageCount { get; }
}
}
