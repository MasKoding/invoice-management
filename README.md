# Aplikasi Invoice Management #

Aplikasi ini dipakai untuk mengelola invoice dengan berbagai metode pembayaran masa kini.
Diantara metode pembayaran yang akan di support di antara lain :

* Virtual Account Bank

    * Bank BNI
    * Bank CIMB
    * Bank BSI

* e-wallet
    * Ovo
    * Gopay

* QR Payment
    * QRIS

# Cara Setup Database #
1. Jalankan postgresql di docker

```
docker run --rm \
    --name invoicedb \
    -e POSTGRES_DB=invoicedb \
    -e POSTGRES_USER=invoice \
    -e POSTGRES_PASSWORD=4IGQ6XzcZ3BgaBIB1qcQ \
    -e PGDATA=/var/lib/postgresql/data/pgdata \
    -v "$(pwd)/invoicedb-data:/var/lib/postgresql/data" \
    -p 5432:5432 \
    postgres:13
```