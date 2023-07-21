
fun is_older (date1 : int * int * int, date2 : int * int * int) =
    if #1 date1 <> #1 date2
    then #1 date1 < #1 date2
    else if #2 date1 <> #2 date2
    then #2 date1 < #2 date2
    else #3 date1 < #3 date2			
   
fun number_in_month (ds : (int * int * int) list,  month : int) =
    if null ds
    then 0
    else if #2 (hd ds) = month
    then 1 + (number_in_month(tl ds, month))
    else 0 + (number_in_month(tl ds, month))

fun number_in_months (ds : (int * int * int) list,  months : int list) =
    if null ds
    then 0
    else if null months
    then 0
    else  number_in_month(ds, hd months) + number_in_months(ds, tl months)

fun dates_in_month (ds : (int * int * int) list, month : int) =
    if null ds
    then []
    else if #2 (hd ds) = month
    then hd ds :: dates_in_month(tl ds, month)
    else dates_in_month(tl ds, month)
	     
fun dates_in_months (ds : (int * int * int) list,  months : int list) =
    if null ds
    then []
    else if null months
    then []
    else dates_in_month(ds, hd months) @ dates_in_months(ds, tl months)

fun get_nth (ss : string list, i : int) =
    if null ss
    then hd []
    else if i = 1
    then hd ss
    else get_nth(tl ss, i - 1)

fun date_to_string (ds : int * int * int) =
    let val months = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October","November", "December"]
    in get_nth(months, #2 ds) ^ " " ^ Int.toString(#3 ds) ^ ", " ^ Int.toString(#1 ds)
    end

fun number_before_reaching_sum (sum : int, vs : int list) =
    let val s1 = sum - hd vs
    in
	if null vs
	then 0
	else if s1 <= 0 
	then 0
	else 1 + number_before_reaching_sum(s1, tl vs)
    end

fun what_month (day : int) =
    let val months_days = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
    in
	1 + number_before_reaching_sum(day, months_days)
    end

fun month_range (day1 : int, day2 : int) =
    if day1 > day2
    then []
    else if day1 <= day2
    then what_month(day1) :: month_range(day1 + 1, day2)
    else []
	
fun oldest (ds : (int * int * int) list) =
    if null ds
    then NONE
    else
	let fun oldest_nonempty(ds : (int * int * int) list) =
	    if null (tl ds)
	    then hd ds
	    else let val t_max = oldest_nonempty(tl ds)
		in	    
		    if is_older(hd ds, t_max)
		    then hd ds
		    else t_max
		 end
	in SOME (oldest_nonempty ds)
	end 
