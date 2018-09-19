#==== Curent_Call ===============================================================================================================================================================
#done teak

group_starttime=$(date | awk '{print $4}')
echo "****************************************************************************************************************************************************************************"
echo "============================================== $group_starttime $day-$month-$year =============================================================="

group_1=$(asterisk -rx "core show channels" | grep "active calls" | awk '{print $1}')
echo "Active Call On Proxy "

i=0
SSH_PORT=8222
LIST_PROXY=(192.168.10.100 192.168.10.101 192.168.10.102 192.168.10.103 192.168.10.104 192.168.10.105)
echo LIST_PROXY
arr=()
for proxy in "${LIST_PROXY[@]}"
do

        echo "======$i======================"
	group=$(ssh -oPort=$SSH_PORT $proxy 'asterisk -rx "core show channels" | grep "active calls"' | awk '{print $1}')
	arr=("${arr[@]}" "$group")
	echo "Active Call On Proxy $proxy ==========>>> ${arr[$i]}"
	i=$(($i+1))
done
