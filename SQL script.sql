create database n26;

use n26;

create table resgistro(
    `numero do documento` varchar(11) not null,
    `codigo do cliente` int not null unique auto_increment,
    endereco_id varchar(10) not null unique,
    info_pessoal_id varchar(10) not null unique,
    info_conta_id varchar(10) not null unique,
    info_cartoes_e_limite_id varchar(10) not null unique,
    info_sistema_id varchar(10) not null unique,
    datas_id varchar(10) not null unique,
    primary key (`numero do documento`)
    );
    
    create table dado_cliente(
    info_pessoal_id varchar(10) not null unique,
    nome varchar(45) not null,
    idade int unsigned not null,
    `estado civil` varchar(8) not null,
    `renda mensal` float unsigned not null,
    `data de nascimento` date not null,
    `razao social do cliente` varchar(200) unique,
    `nome da mae do cliente` varchar(45),
    primary key (info_pessoal_id)
    );
    
alter table dado_cliente engine = MyISAM;
    alter table dado_cliente
    add foreign key (info_pessoal_id) references registro(info_pessoal_id);
    
    create table endereco(
    endereco_id varchar(10) not null unique,
    telefone varchar(11) not null unique,
    email varchar(90) not null unique,
    país varchar(38) not null,
    estado varchar(25) not null,
    cidade varchar(58) not null,
	bairro varchar(85) not null,
    `latitude e longitude do cliente` point not null,
    primary key (endereco_id)
    );
    
    alter table endereco engine = MyISAM;
    alter table endereco
    add foreign key (endereco_id) references registro(endereco_id);
    
    create table sistema_operacional(
    info_sistema_id varchar(10) not null unique,
    `modelo de aparelho celular do cliente` varchar(25),
    `versão do SO do aparelho celular do cliente` varchar(20),
    `operadora telefonica do cliente` varchar(46),
    `versao do app do cliente` varchar(8),
    primary key (info_sistema_id)
    );
    
	alter table sistema_operacional engine = MyISAM;
    alter table sistema_operacional
    add foreign key (info_sistema_id) references registro(info_sistema_id);
    
    create table conta(
    info_conta_id varchar(10) not null unique,
    `tipo de cliente` varchar(2) not null,
    `tipo de conta do cliente` varchar(4) not null,
    `status do cliente` varchar(9) not null,
    `saldo na conta corrente` float not null,
    `email` varchar(90) not null unique,
    `password do cliente` varchar(20) not null,
    PPE boolean not null,
    `pix ativo` boolean not null,
    `possui emprestimo ativo` boolean not null,
    `quantidade de N26 spaces criados` int unsigned not null,
    primary key (info_conta_id)
    );
    
    alter table conta engine = MyISAM;
    alter table conta
    add foreign key (info_conta_id) references registro(info_conta_id);
    
    create table credito(
    info_cartoes_e_limite_id varchar(10) not null unique,
    `quantidade de cartões virtuais` int unsigned,
    `credito pre aprovado` boolean not null,
    `limite do cartão de credito` float unsigned,
    `cor do cartão do cliente` varchar(12),
    `data do vencimento da fatura do cartão de crédito` date,
    `status rastreio do cartão do cliente` varchar(20),
    `ultimos digitos do cartao do cliente` varchar(4),
    primary key (info_cartoes_e_limite_id)
    );
    
    alter table credito engine = MyISAM;
    alter table credito
    add foreign key (info_cartoes_e_limite_id) references registro(info_cartoes_e_limite_id);
    
    create table registro_data(
    datas_id varchar(10) not null unique,
    `data de cadastro` date not null,
    `data do ultimo login na conta` date,
    `data da ultima transacao financeira` date,
    `data da primeira transaco de cartao de debito` date,
    `data da ultima transaco de cartao de debito` date,
    `data da primeira transaco de cartao de credito` date,
    `data da ultima transaco de cartao de credito` date,
    `data da primeira transaco usando carteiras digitais` date,
    `data da ultima transaco usando carteiras digitais` date,
    `data do primeiro cashin` date,
    `data do ultimo cashin` date,
    `data do primeiro cashout` date,
    `data do ultimo cashout` date,
    `data do primeiro pix cashin do cliente` date,
    `data do ultimo pix cashin do cliente` date,
    `data do primeiro pix cashout do cliente` date,
    `data do ultimo pix cashout do cliente` date,
    `data de inicio do onboarding` date,
    `data de fim do onboarding` date,
    `data de pedido do cartão físico` date,
    `data de recebimento do cartão físico` date,
    `data de envio de documentos do cliente` date,
    `data de cancelamento da conta` date,
    primary key (datas_id)
    );
    
    alter table registro_data engine = MyISAM;
    alter table registro_data
    add foreign key (datas_id) references registro(datas_id);
    

    
    
