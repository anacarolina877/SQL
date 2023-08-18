-- criação do banco de dados para o cenário de E-commerce  
 -- drop database ecommerce; 
 --Create tabelas de ecommerce; 
 
  
 -- criar tabela cliente 
 create table clients( 
                 idClient int auto_increment primary key, 
         Fname varchar(12), 
         Minit char(5), 
         Lname varchar(28), 
         CPF char(15) not null, 
         Address varchar(48), 
         ; 
  
 alter table clients auto_increment=1; 
  
 -- desc clients; 
 
  
 create tabela pagamentos( 
         idclient int, 
     idPayment int, 
     typePayment enum('Boleto','Cartão','PIX'), 
     limitAvailable float, 
     primary key(idClient, idPayment) 
 ); 
 
 create tabela fornecedor ( 
         idPsSupplier int, 
     idPsProduct int, 
     quantity int not null, 
     primary key (idPsSupplier, idPsProduct), 
     constraint fk_product_supplier_supplier foreign key (idPsSupplier) references supplier(idSupplier), 
     constraint fk_product_supplier_prodcut foreign key (idPsProduct) references product(idProduct) 
 );
 
 -- criar tabela produto 
  
 -- size = dimensão do produto 
 create table product( 
                 idProduct int auto_increment primary key, 
         Pname varchar not null, 
         
  
 alter table product auto_increment=1; 
  
  
  
 -- criar tabela de pedidos de devolução 
 -- drop table orders; 
 create table orders( 
         idOrder int auto_increment primary key, 
     idOrderClient int, 
     orderStatus enum('Devolucão realizada com sucesso', 'Em processamento') default 'Em processamento', 
     orderDescription varchar(255), 
     sendValue float default 10, 
     paymentCash boolean default false,  
     constraint fk_ordes_client foreign key (idOrderClient) references clients(idClient) 
                         on update cascade 
 ); 
 alter table orders auto_increment=1; 
  
 desc orders; 
  
 -- criar tabela estoque 
 create table productStorage( 
         idProdStorage int auto_increment primary key, 
     storageLocation varchar(255), 
     quantity int default 0 
 ); 
 alter table productStorage auto_increment=1; 
 
 -- criar tabela vendedor 
 create table seller( 
         idSeller int auto_increment primary key, 
     SocialName varchar(255) not null, 
     AbstName varchar(255), 
     CNPJ char(15), 
     CPF char(9), 
     location varchar(255), 
     contact char(11) not null, 
     constraint unique_cnpj_seller unique (CNPJ), 
     constraint unique_cpf_seller unique (CPF) 
 ); 
  
 alter table seller auto_increment=1; 
  
  
 -- tabelas de relacionamentos M:N 
  
 criar tabela productSeller( 
         idPseller int, 
     idPproduct int, 
     prodQuantity int default 1, 
     primary key (idPseller, idPproduct), 
     constraint fk_product_seller foreign key (idPseller) references seller(idSeller), 
     constraint fk_product_product foreign key (idPproduct) references product(idProduct) 
 ); 
  
 desc productSeller;
  
  

 criar tabela productOrder( 
         idPOproduct int, 
     idPOorder int, 
     poQuantity int default 1, 
     poStatus enum('Disponível', 'Sem estoque') default 'Disponível', 
     primary key (idPOproduct, idPOorder), 
     constraint fk_productorder_product foreign key (idPOproduct) references product(idProduct), 
     constraint fk_productorder_order foreign key (idPOorder) references orders(idOrder) 
  
 ); 
  
 create tabela storageLocation( 
         idLproduct int, 
     idLstorage int, 
     location varchar(255) not null, 
     primary key (idLproduct, idLstorage), 
     constraint fk_storage_location_product foreign key (idLproduct) references product(idProduct), 
     constraint fk_storage_location_storage foreign key (idLstorage) references productStorage(idProdStorage) 
 ); 
  
 
  
 show tables; 
  
 show databases; 
 use information_schema; 
 show tables; 
 desc referential_constraints; 
 select * from referential_constraints where constraint_schema = 'ecommerce';

