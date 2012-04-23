using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Net;
using System.Threading;
using Microsoft.WindowsAzure;
using Microsoft.WindowsAzure.Diagnostics;
using Microsoft.WindowsAzure.ServiceRuntime;
using Microsoft.WindowsAzure.StorageClient;
using AzureHacks.Domain;
using AzureStorage;
using AzureHacks.Domain.Commands;
using AzureStorage.Storage;
using AzureHacks.Domain.Models;
namespace AzureHacks.Worker
{
    public class WorkerRole : RoleEntryPoint
    {
        public override void Run()
        {
             CloudStorageAccount.SetConfigurationSettingPublisher(
              (name, publisher) =>
              {
                  var connectionString = RoleEnvironment.GetConfigurationSettingValue(name);
                  publisher(connectionString);
              }
            );

        var account = CloudStorageAccount.FromConfigurationSetting("DataConnectionString");
        AzureQueue<NewCustomerCommand> queue = new AzureQueue<NewCustomerCommand>(account);
        queue.EnsureExist();            
            
        while (true)
        {
            try
            {
                var message = queue.GetMessage();                    
                if (message != null)
                {
                    AzureTable<Customer> table = new AzureTable<Customer>(account);
                    var guiid= Guid.NewGuid().ToString();
                    table.AddEntity( new Customer
                    {
                        Id = Guid.NewGuid().ToString(),
                        PartitionKey = guiid,
                        RowKey = message.FirstName,
                        FirstName = message.FirstName,
                        LastName=message.LastName,
                        Address=message.Address,
                        Phone=message.Phone,
                        Email=message.Email 
                    });
                    queue.DeleteMessage(message);
                }
            }
            catch { }
            Thread.Sleep(5000);
        }
        }

        public override bool OnStart()
        {
            // Set the maximum number of concurrent connections 
            ServicePointManager.DefaultConnectionLimit = 12;

            // For information on handling configuration changes
            // see the MSDN topic at http://go.microsoft.com/fwlink/?LinkId=166357.

            return base.OnStart();
        }
    }
}
