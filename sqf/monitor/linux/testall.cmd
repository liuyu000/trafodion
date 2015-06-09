startup trace 0
echo ===Test1-Client/Server, priority, open, close, processinfo
exec shell test1.sub
echo ===Test2-Client/Server Multi pass
!shutdown
!startup trace 0
!exec shell test2.sub
echo ===Test3-NonStop Process Pairs
exec shell test3.sub
echo ===Test4-Configuration Tests
!exec shell test4.sub
echo ===Test5-Get TM seq#
exec shell test5.sub
echo ===Test6-Process Death notices
!exec shell test6.sub
echo ===Test7-Start Lots of processes
exec shell test7.sub
echo ===Test8-DTM Sync
exec shell test8.sub
echo Start Test5 - DOWN Node test
down 2
delay 1
ps
! should abort
event {DTM} 5
delay 5
! should commit
event {DTM} 5
delay 5

echo Exit DTMs
event {DTM} 6
delay 1
ps
shutdown
