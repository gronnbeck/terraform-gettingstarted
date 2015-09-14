# Terraform Getting Started

Creating a plan
```sh
> terraform plan
```

Execute
```
> terraform apply
```

Creating a graph
```sh
 > terraform graph | dot -Tpdf > graph.pdf
```


Credentials should be stored in ``terraform.tfvars``, which should be ignored,
and should be on the following form

```
access_key = "<access>"
secret_key = "<secret>"
```

## Modules

Could not get modules to work. WTH is going on...
