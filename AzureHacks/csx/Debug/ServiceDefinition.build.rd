<?xml version="1.0" encoding="utf-8"?>
<serviceModel xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" name="AzureHacks" generation="1" functional="0" release="0" Id="f9517c47-5829-45d8-aaa4-d376b05048c3" dslVersion="1.2.0.0" xmlns="http://schemas.microsoft.com/dsltools/RDSM">
  <groups>
    <group name="AzureHacksGroup" generation="1" functional="0" release="0">
      <componentports>
        <inPort name="AzureHacks.Web:Endpoint1" protocol="http">
          <inToChannel>
            <lBChannelMoniker name="/AzureHacks/AzureHacksGroup/LB:AzureHacks.Web:Endpoint1" />
          </inToChannel>
        </inPort>
      </componentports>
      <settings>
        <aCS name="AzureHacks.Web:DataConnectionString" defaultValue="">
          <maps>
            <mapMoniker name="/AzureHacks/AzureHacksGroup/MapAzureHacks.Web:DataConnectionString" />
          </maps>
        </aCS>
        <aCS name="AzureHacks.Web:Microsoft.WindowsAzure.Plugins.Diagnostics.ConnectionString" defaultValue="">
          <maps>
            <mapMoniker name="/AzureHacks/AzureHacksGroup/MapAzureHacks.Web:Microsoft.WindowsAzure.Plugins.Diagnostics.ConnectionString" />
          </maps>
        </aCS>
        <aCS name="AzureHacks.WebInstances" defaultValue="[1,1,1]">
          <maps>
            <mapMoniker name="/AzureHacks/AzureHacksGroup/MapAzureHacks.WebInstances" />
          </maps>
        </aCS>
        <aCS name="AzureHacks.Worker:DataConnectionString" defaultValue="">
          <maps>
            <mapMoniker name="/AzureHacks/AzureHacksGroup/MapAzureHacks.Worker:DataConnectionString" />
          </maps>
        </aCS>
        <aCS name="AzureHacks.Worker:Microsoft.WindowsAzure.Plugins.Diagnostics.ConnectionString" defaultValue="">
          <maps>
            <mapMoniker name="/AzureHacks/AzureHacksGroup/MapAzureHacks.Worker:Microsoft.WindowsAzure.Plugins.Diagnostics.ConnectionString" />
          </maps>
        </aCS>
        <aCS name="AzureHacks.WorkerInstances" defaultValue="[1,1,1]">
          <maps>
            <mapMoniker name="/AzureHacks/AzureHacksGroup/MapAzureHacks.WorkerInstances" />
          </maps>
        </aCS>
      </settings>
      <channels>
        <lBChannel name="LB:AzureHacks.Web:Endpoint1">
          <toPorts>
            <inPortMoniker name="/AzureHacks/AzureHacksGroup/AzureHacks.Web/Endpoint1" />
          </toPorts>
        </lBChannel>
      </channels>
      <maps>
        <map name="MapAzureHacks.Web:DataConnectionString" kind="Identity">
          <setting>
            <aCSMoniker name="/AzureHacks/AzureHacksGroup/AzureHacks.Web/DataConnectionString" />
          </setting>
        </map>
        <map name="MapAzureHacks.Web:Microsoft.WindowsAzure.Plugins.Diagnostics.ConnectionString" kind="Identity">
          <setting>
            <aCSMoniker name="/AzureHacks/AzureHacksGroup/AzureHacks.Web/Microsoft.WindowsAzure.Plugins.Diagnostics.ConnectionString" />
          </setting>
        </map>
        <map name="MapAzureHacks.WebInstances" kind="Identity">
          <setting>
            <sCSPolicyIDMoniker name="/AzureHacks/AzureHacksGroup/AzureHacks.WebInstances" />
          </setting>
        </map>
        <map name="MapAzureHacks.Worker:DataConnectionString" kind="Identity">
          <setting>
            <aCSMoniker name="/AzureHacks/AzureHacksGroup/AzureHacks.Worker/DataConnectionString" />
          </setting>
        </map>
        <map name="MapAzureHacks.Worker:Microsoft.WindowsAzure.Plugins.Diagnostics.ConnectionString" kind="Identity">
          <setting>
            <aCSMoniker name="/AzureHacks/AzureHacksGroup/AzureHacks.Worker/Microsoft.WindowsAzure.Plugins.Diagnostics.ConnectionString" />
          </setting>
        </map>
        <map name="MapAzureHacks.WorkerInstances" kind="Identity">
          <setting>
            <sCSPolicyIDMoniker name="/AzureHacks/AzureHacksGroup/AzureHacks.WorkerInstances" />
          </setting>
        </map>
      </maps>
      <components>
        <groupHascomponents>
          <role name="AzureHacks.Web" generation="1" functional="0" release="0" software="D:\shiju\AzureHack\AzureHacks\csx\Debug\roles\AzureHacks.Web" entryPoint="base\x86\WaHostBootstrapper.exe" parameters="base\x86\WaIISHost.exe " memIndex="1792" hostingEnvironment="frontendadmin" hostingEnvironmentVersion="2">
            <componentports>
              <inPort name="Endpoint1" protocol="http" portRanges="80" />
            </componentports>
            <settings>
              <aCS name="DataConnectionString" defaultValue="" />
              <aCS name="Microsoft.WindowsAzure.Plugins.Diagnostics.ConnectionString" defaultValue="" />
              <aCS name="__ModelData" defaultValue="&lt;m role=&quot;AzureHacks.Web&quot; xmlns=&quot;urn:azure:m:v1&quot;&gt;&lt;r name=&quot;AzureHacks.Web&quot;&gt;&lt;e name=&quot;Endpoint1&quot; /&gt;&lt;/r&gt;&lt;r name=&quot;AzureHacks.Worker&quot; /&gt;&lt;/m&gt;" />
            </settings>
            <resourcereferences>
              <resourceReference name="DiagnosticStore" defaultAmount="[4096,4096,4096]" defaultSticky="true" kind="Directory" />
              <resourceReference name="EventStore" defaultAmount="[1000,1000,1000]" defaultSticky="false" kind="LogStore" />
            </resourcereferences>
          </role>
          <sCSPolicy>
            <sCSPolicyIDMoniker name="/AzureHacks/AzureHacksGroup/AzureHacks.WebInstances" />
            <sCSPolicyFaultDomainMoniker name="/AzureHacks/AzureHacksGroup/AzureHacks.WebFaultDomains" />
          </sCSPolicy>
        </groupHascomponents>
        <groupHascomponents>
          <role name="AzureHacks.Worker" generation="1" functional="0" release="0" software="D:\shiju\AzureHack\AzureHacks\csx\Debug\roles\AzureHacks.Worker" entryPoint="base\x86\WaHostBootstrapper.exe" parameters="base\x86\WaWorkerHost.exe " memIndex="1792" hostingEnvironment="consoleroleadmin" hostingEnvironmentVersion="2">
            <settings>
              <aCS name="DataConnectionString" defaultValue="" />
              <aCS name="Microsoft.WindowsAzure.Plugins.Diagnostics.ConnectionString" defaultValue="" />
              <aCS name="__ModelData" defaultValue="&lt;m role=&quot;AzureHacks.Worker&quot; xmlns=&quot;urn:azure:m:v1&quot;&gt;&lt;r name=&quot;AzureHacks.Web&quot;&gt;&lt;e name=&quot;Endpoint1&quot; /&gt;&lt;/r&gt;&lt;r name=&quot;AzureHacks.Worker&quot; /&gt;&lt;/m&gt;" />
            </settings>
            <resourcereferences>
              <resourceReference name="DiagnosticStore" defaultAmount="[4096,4096,4096]" defaultSticky="true" kind="Directory" />
              <resourceReference name="EventStore" defaultAmount="[1000,1000,1000]" defaultSticky="false" kind="LogStore" />
            </resourcereferences>
          </role>
          <sCSPolicy>
            <sCSPolicyIDMoniker name="/AzureHacks/AzureHacksGroup/AzureHacks.WorkerInstances" />
            <sCSPolicyFaultDomainMoniker name="/AzureHacks/AzureHacksGroup/AzureHacks.WorkerFaultDomains" />
          </sCSPolicy>
        </groupHascomponents>
      </components>
      <sCSPolicy>
        <sCSPolicyFaultDomain name="AzureHacks.WebFaultDomains" defaultPolicy="[2,2,2]" />
        <sCSPolicyFaultDomain name="AzureHacks.WorkerFaultDomains" defaultPolicy="[2,2,2]" />
        <sCSPolicyID name="AzureHacks.WebInstances" defaultPolicy="[1,1,1]" />
        <sCSPolicyID name="AzureHacks.WorkerInstances" defaultPolicy="[1,1,1]" />
      </sCSPolicy>
    </group>
  </groups>
  <implements>
    <implementation Id="ece73857-38c5-4989-bc3c-ecda826704a9" ref="Microsoft.RedDog.Contract\ServiceContract\AzureHacksContract@ServiceDefinition.build">
      <interfacereferences>
        <interfaceReference Id="2bf945c4-3731-4d40-8482-550252d51680" ref="Microsoft.RedDog.Contract\Interface\AzureHacks.Web:Endpoint1@ServiceDefinition.build">
          <inPort>
            <inPortMoniker name="/AzureHacks/AzureHacksGroup/AzureHacks.Web:Endpoint1" />
          </inPort>
        </interfaceReference>
      </interfacereferences>
    </implementation>
  </implements>
</serviceModel>