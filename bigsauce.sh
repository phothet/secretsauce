#secretsauce recipe with gnupg gpg

# https://yanhan.github.io/posts/2014-03-04-gpg-how-to-trust-imported-key.html
# http://blog.ghostinthemachines.com/2015/03/01/how-to-use-gpg-command-line/
# https://www.lifewire.com/wipe-vs-shred-vs-delete-vs-erase-whats-the-difference-2619146

#without screen running, we can't enter password
yum -y install screen

#generate gpg key
#chooe 4096
#if slow, it's good to install haveaged or some sort
gpg --gen-key

#type in username (not firstname last name. just username)
#type in password

#export your public key for others in ascii mode
gpg -a --export > mypubkey.asc

#and import other keys
gpg --import jimkey.asc joekey.asc

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
wipe secretsauce.txt #OR
erase secretsauce.txt #OR
shred secretsauce.txt #OR

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
gpg -e -r topchef secretsauce.txt

#make sure to remember to remove the original file once it's encrypted
#wipe, shred and erase secretsauce.txt
wipe secretsauce.txt #OR
erase secretsauce.txt #OR
shred secretsauce.txt #OR




