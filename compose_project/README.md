### Usage

```
cp ansible_hosts.example ansible_hosts
cp ansible_var_prepare.yml.example ansible_var_prepare.yml
```

```
bash ansible_playbook_prepare.sh -e "@ansible_var_prepare.yml" -i ansible_hosts
```

```
cd /data/data_postgres/compose_project
bash docker-compose.sh up
```

```
psql -h localhost -U user db

Password: ENV["POSTGRES_PASSWORD"]
```
