﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Microsoft.WindowsAzure.StorageClient;

namespace AzureStorage.StorageContract
{
    public interface IAzureTable<TEntity> where TEntity : TableServiceEntity
    {
        IQueryable<TEntity> Query { get; }

        bool CreateIfNotExist();

        bool DeleteIfExist();

        void AddEntity(TEntity obj);

        void AddEntity(IEnumerable<TEntity> objs);

        void AddOrUpdateEntity(TEntity obj);

        void AddOrUpdateEntity(IEnumerable<TEntity> objs);

        void DeleteEntity(TEntity obj);

        void DeleteEntity(IEnumerable<TEntity> objs);
    }
}
