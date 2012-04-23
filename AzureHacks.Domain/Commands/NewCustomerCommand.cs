using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using AzureStorage.StorageContract;

namespace AzureHacks.Domain.Commands
{
    public class NewCustomerCommand : AzureQueueMessage
    {
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string Address { get; set; }
        public string Phone { get; set; }
        public string Email { get; set; }
    }
}
