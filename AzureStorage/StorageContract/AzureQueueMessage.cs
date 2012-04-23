using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace AzureStorage.StorageContract
{
public abstract class AzureQueueMessage
{
    public string Id { get; set; }
    public string PopReceipt { get; set; }
    public int DequeueCount { get; set; }
    public DateTime? InsertionTime { get;  set; }
    public DateTime? ExpirationTime { get; set; }
}
}
