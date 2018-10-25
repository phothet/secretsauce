secretsauce recipe with gnupg gpg

yum -y install screen
gpg --gen-key

#type in username (not firstname last name. just username)
#type in password

#retrieve pub key by running 
gpg --list-key

vi ~/.gnupg/gpg.conf

#enter group users 
group topchef = jim joe jane matt or pubkeyid (0xpubkey)

#create secretsauce.txt that contains the secret recipe
vi secretsauce.txt

#encrypt the file and only allow topchef to open
gpg -e -r mygroup secretsauce.txt

#this will create an encrypted file with .gpg extension
secretsauce.txt.gpg

#remove the original file once it's encrypted
#wipe, shred and erase secretsauce.txt
wipe secretsauce.txt
erase secretsauce.txt
shred secretsauce.txt

#if jim wants to open the file he needs to update his ~/.gnupg/gpg.conf with all the topchefs name or pubkey id
#from jim's shell
vi ~/.gnupg/gpg.conf
#enter group users 
group topchef = jim joe jane matt or pubkeyid (0xpubkey)

#decrypt the file
gpg secretsauce.txt.gpg

#view the secret recipe and update as needed
vi secretsauce.txt

#reencrypt the file if new recipes are added
gpg -e -r mygroup secretsauce.txt

#make sure to remember to remove the original file once it's encrypted
#wipe, shred and erase secretsauce.txt
wipe secretsauce.txt
erase secretsauce.txt
shred secretsauce.txt




