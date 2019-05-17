# Problem Building Go on t2.small of FreeBSD

Reproduce by running:

```bash
terraform init
terraform plan -out plan.out
terraform apply
```

It will take a bit before the instance is up.  Eventually this command
will succeed:

```bash
scp build-packer.sh ec2-user@$(terraform output ip):
ssh ec2-user@$(terraform output ip)
```

Now you're on the FreeBSD t2.small instance.  Run the build-packer.sh
script with `sh build-packer.sh`.  It will evenually fail at the link
step for packer.

Let's see what happens with more memory - switch to a t2.medium...

```bash
terraform plan -var instance_type=t2.medium -out plan.out
terraform apply
```

This will cause a reboot.  Wait and login and just try the build packer
step:

```bash
ssh ec2-user@$(terraform output ip)
cd /usr/ports/sysutils/packer
su -c "make clean install"
```

And this will succeed.
