# set default values for the Azure CLI
az configure --defaults group=learn-0e687086-3b32-4a94-8cc4-06df5a96558e location=westus2

# Create a random unique name for the namespace
NS_NAME=ehubns-$RANDOM

# Create the Event Hubs namespace
az eventhubs namespace create --name $NS_NAME

# Fetch the connection string for your Event Hubs namespace 
az eventhubs namespace authorization-rule keys list \
    --name RootManageSharedAccessKey \
    --namespace-name $NS_NAME


# Create a random unique name for the EventHub
HUB_NAME=hubname-$RANDOM

# Create a new Event Hub
az eventhubs eventhub create --name $HUB_NAME --namespace-name $NS_NAME

# View the details of your Event Hub 
az eventhubs eventhub show --namespace-name $NS_NAME --name $HUB_NAME

# Create a random unique name for the Storage Account
STORAGE_NAME=storagename$RANDOM

# Create a new Storage Account
az storage account create --name $STORAGE_NAME --sku Standard_RAGRS --encryption-service blob

# List all the access keys associated with your storage account 
az storage account keys list --account-name $STORAGE_NAME

# View the connections string for your storage account
az storage account show-connection-string -n $STORAGE_NAME

# Create a container called messages
az storage container create --name messages --connection-string "connection string"