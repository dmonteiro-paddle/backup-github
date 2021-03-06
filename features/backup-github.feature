Feature: backup data from Paddle's Github Repositories

In order provide backups of our Github data, paddle system engineering
team would like to have a system which makes a backup of the current Github Repositories into an S3 location.

    Background: we have prepared to run encrypted backups
    given I have access to an account for doing backups
        and I have a private public key pair
        and the public key from that key pair is stored in an s3 bucket
        
    Scenario: store encrypted backup in S3
    given that I have configured my settings in SSM
     and that I have a github repo to backup
     and that I have a backup context configured with matching users
    when I request a backup of that repo using the context
    then a backup object should be created in the S3 destination bucket
     and if I decrypt that file the content with the private key it should match the original repo

    @wip
    Scenario: backup the github repos with encryption then restore with decryption
    given I have a private public key pair
        and that my s3 bucket is empty
        when I run a backup on the github repo's using the public key
        and I restore that backup of the github repo's using the private key
        then the s3 bucket should not contain unencrypted data
        and the data from the original repo should be in the new repo