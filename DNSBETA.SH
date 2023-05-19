#!/bin/bash   


date > /home/witor/Documentos/logbusca.log
# Declaração das variáveis de dominio que serão usadas nas Funções 
data=$(date)
dominio1=google.com.br
dominio2=yahoo.com.br
dominio3=twitter.com
dominio4=clicksign.com.br
dominio5=twitch.tv

#Variavel onde será armazenados os dados da APi do telegram
id_grupo=-
chave_bot=

#Declaração do Tempo em que a função irá esperar resposta 
timeout=2

# variaveis De consulta dos DNS.
ip=(
186.211.32.10
200.202.111.10
186.211.32.11
200.202.111.11
186.211.32.12
200.202.111.12
186.211.32.58
186.211.32.98
186.211.32.59
186.211.32.56
200.202.111.58
200.202.111.98
)

# Função denominada teste que vai do 1 ao 5, onde será testado cada DNS nos dominios armazenados, também Utilizado a estrutura condicional para o envio de mensagem através do Curl caso a verificação não tenha resposta.
         function testedns1 {
                

                timeout $timeout dig "@"$dns "$dominio1"

                        if [ $? -eq 0 ]; then
                                echo -e " $dominio1 $erro1 "$v1" $dns \n$data\n" >> /home/witor/Documentos/logbusca.log
                                
         
                         else 
                         echo ""
                             curl -s -X POST https://api.telegram.org/bot$chave_bot/sendMessage? -d chat_id=$id_grupo -d text="                           
⚠️ ALERTA:DNS ⚠️       🖥                  
IP $dns  
DOMINIO: $dominio1
SERVIDOR:$erro1
TEMPO DE RESPOSTA: $t1⌛️ 
⏰$data" 
          fi 
                
 }                                                                                                 
                                                                                 
         function testedns2 {

                 timeout $timeout dig "@"$dns "$dominio2"
         
                        if [ $? -eq 0 ]; then
                                echo -e " $dominio2 $erro2 "$v2" $dns \n$data\n" >> /home/witor/Documentos/logbusca.log
                            
         
                         else 
                         echo ""
                             curl -s -X POST https://api.telegram.org/bot$chave_bot/sendMessage? -d chat_id=$id_grupo -d text="                           
⚠️ ALERTA:DNS ⚠️       🖥                  
IP $dns  
DOMINIO: $dominio2
SERVIDOR:$erro2
TEMPO DE RESPOSTA: $t2⌛️ 
⏰$data" 
          fi 
 
                
 }                                                                                                 
                                                                                                 
         function testedns3 {

               timeout $timeout dig "@"$dns "$dominio3"
         
                        if [ $? -eq 0 ]; then
                                echo -e " $dominio3 $erro3 "$v3" $dns \n$data\n" >> /home/witor/Documentos/logbusca.log
                              
         
                         else 
                         echo ""
                             curl -s -X POST https://api.telegram.org/bot$chave_bot/sendMessage? -d chat_id=$id_grupo -d text="                           
⚠️ ALERTA:DNS ⚠️       🖥                  
IP $dns  
DOMINIO: $dominio3
SERVIDOR:$erro3
TEMPO DE RESPOSTA: $t3⌛️ 
⏰$data" 
          fi 
 
                
 }                                                                                                 
                                                                                                 
         function testedns4 {

                timeout $timeout dig "@"$dns "$dominio4"
         
                        if [ $? -eq 0 ]; then
                                echo -e " $dominio4 $erro4 "$v4" $dns \n$data\n" >> /home/witor/Documentos/logbusca.log
                              
         
                         else 
                         echo ""
                             curl -s -X POST https://api.telegram.org/bot$chave_bot/sendMessage? -d chat_id=$id_grupo -d text="                           
⚠️ ALERTA:DNS ⚠️       🖥                  
IP $dns  
DOMINIO: $dominio4
SERVIDOR:$erro4
TEMPO DE RESPOSTA: $t4⌛️ 
⏰$data" 
          fi 
 
                
 }                                                                                                 
                                                                                                
         function testedns5 {

               timeout $timeout dig "@"$dns "$dominio5"
         
                        if [ $? -eq 0 ]; then
                                echo -e " $dominio5 $erro5 "$v5" $dns \n$data\n" >> /home/witor/Documentos/logbusca.log
                                
         
                         else 
                         echo ""
                             curl -s -X POST https://api.telegram.org/bot$chave_bot/sendMessage? -d chat_id=$id_grupo -d text="                           
⚠️ ALERTA:DNS ⚠️       🖥                  
IP $dns  
DOMINIO: $dominio5
SERVIDOR:$erro5
TEMPO DE RESPOSTA: $t5⌛️ 
⏰$data" 
          fi 
 
                
 }                                                                                                 
                                                                                                 
# Laço de repetição, criado para chamar as Funções e Coleta de Informações através do nslokup armazenados na variáve: erro, v e t.

for dns in "${ip[@]}" ; do
        erro1=$(nslookup $dns | grep -o 'name = .*' | awk '{print $3}' | awk -F. '{print $1}')
        erro2=$(nslookup $dns | grep -o 'name = .*' | awk '{print $3}' | awk -F. '{print $1}')
        erro3=$(nslookup $dns | grep -o 'name = .*' | awk '{print $3}' | awk -F. '{print $1}')
        erro4=$(nslookup $dns | grep -o 'name = .*' | awk '{print $3}' | awk -F. '{print $1}')
        erro5=$(nslookup $dns | grep -o 'name = .*' | awk '{print $3}' | awk -F. '{print $1}')
      
        v1=$(timeout $timeout dig "@"$dns "$dominio1" | grep "status:" | awk -F ',' '{print $2}' )
        v2=$(timeout $timeout dig "@"$dns "$dominio2" | grep "status:" | awk -F ',' '{print $2}' )
        v3=$(timeout $timeout dig "@"$dns "$dominio3" | grep "status:" | awk -F ',' '{print $2}' )
        v4=$(timeout $timeout dig "@"$dns "$dominio4" | grep "status:" | awk -F ',' '{print $2}' )
        v5=$(timeout $timeout dig "@"$dns "$dominio5" | grep "status:" | awk -F ',' '{print $2}' ) 
        
        t1=$(timeout $timeout dig "@"$dns "$dominio1" | grep 'time:' | awk  '{print $4 $5}')
        t2=$(timeout $timeout dig "@"$dns "$dominio2" | grep 'time:' | awk  '{print $4 $5}')
        t3=$(timeout $timeout dig "@"$dns "$dominio3" | grep 'time:' | awk  '{print $4 $5}')
        t4=$(timeout $timeout dig "@"$dns "$dominio4" | grep 'time:' | awk  '{print $4 $5}')
        t5=$(timeout $timeout dig "@"$dns "$dominio5" | grep 'time:' | awk  '{print $4 $5}')
        
         testedns1 "dns"
         testedns2 "dns"
         testedns3 "dns"
         testedns4 "dns"
         testedns5 "dns"
done



# Final do código, onde será realizado uma consulta no arquivo de log procurando erros de resposta de todo o script  
resposta=$(grep "SERVFAIL" /home/witor/Documentos/logbusca.log | awk -F, '{print $1}')  
     if [ -n "$resposta" ]; then 
     curl -s -X POST https://api.telegram.org/bot$chave_bot/sendMessage? -d chat_id=$id_grupo -d text="                                                         
⚠️ ALERTA: SITE SEM RESPOSTA ⚠️       🖥                  
$resposta"         
     else 
          echo " "

fi



