# ok
CALL cadastrar_cliente("Rafael Cardoso", "rafael.cardoso@t-systems.com"); 

# nome < 2 char
CALL cadastrar_cliente("Ze", "ze@t-systems.com"); 

# nome > 30 char
CALL cadastrar_cliente("Rafael Bruno Prates Barbosa Cardoso", "rafa.cardoso@t-systems.com"); 

# e-mail < 10 char
CALL cadastrar_cliente("Joao da Silva", "j@t.com"); 

# e-mail repetido
CALL cadastrar_cliente("Rafael Prates", "rafael.cardoso@t-systems.com"); 

# e-mail com 2 @
CALL cadastrar_cliente("Rafael Prates", "rafael.cardoso@@t-systems.com"); 

# e-mail sem @
CALL cadastrar_cliente("Rafael Prates", "rafael.cardosot-systems.com"); 

# alterar ok
CALL alterar_nome_e_email("Rafael Cardoso", "Rafael Prates", "rafael.prates@t-systems.com");

# alterar com nome inexistente
CALL alterar_nome_e_email("Rafael Cardoso", "Rafael Prates", "rafael.prates@t-systems.com");

# remover por nome ok
CALL cadastrar_cliente("Rafael Cardoso", "rafael.cardoso@t-systems.com"); 
CALL remover_cliente_por_nome("Rafael Cardoso");

# remover por nome com nome inválido
CALL remover_cliente_por_nome("Rafael Cardoso");

# remover por email ok
CALL cadastrar_cliente("Rafael Cardoso", "rafael.cardoso@t-systems.com"); 
CALL remover_cliente_por_email("rafael.cardoso@t-systems.com");

# remover por email inexistente
CALL remover_cliente_por_email("rafael.cardoso@t-systems.com");