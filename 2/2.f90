program hello
    implicit none
    integer, parameter :: rows = 1010, cols = 15
    integer :: i, j
    integer :: matrix(rows, cols)
    integer :: a, b, c, d, e, f, g, h, k, x, y
    character(len=256) :: line
    integer :: ios
    integer :: num_array(10), ioss
    integer :: n = 0
    integer :: lastNum = -1
    integer :: sum = 0 
    integer :: sum2 = 0 
    logical :: safe = .true.
    logical :: safe2 = .true.
    integer :: inc = 0
    integer :: tmp = 0
    integer :: skip = -1;

    open(unit=10, file='input.txt', status='old', action='read')

    do i = 1, rows
        ! read(10, *) a,b,c,d,e,f,g,h,k
        ! matrix(i, 1) = a

        safe = .true.
        safe2 = .true.
        skip = -1
        do x = 1, 10
            num_array(x) = 0
        end do

        read(10, '(A)', IOSTAT=ios) line
        if (ios == 0) then
            read(line, *, IOSTAT=ios) (num_array(j), j=1, 10)
            !print *, "Numbers extracted: "
                n = 0;
                print *, "lineeeeeeeeeeeeeeeeeeee:", trim(line)

            40  skip = skip + 1
                inc = 0
                lastNum = -1
                print *, "try again: ", skip
                

                if (skip > 10) then
                    safe2 = .false.
                    goto 45
                end if 

                do j = 1, 10

                    if (skip == j) then
                        print *, "skipping: ",j
                        goto 50
                    end if

                    print *, "looop:", j, lastNum, num_array(j)

                    if (num_array(j) /= 0) then
                        n = n + 1
                        if (lastNum == -1) then
                            lastNum = num_array(j)
                        else
                            tmp = num_array(j) - lastNum

                            if (inc == 0) then
                                if (tmp > 0) then
                                    inc = 1
                                else if (tmp < 0) then
                                    inc = -1
                                else 
                                    print *, "not safe first and sec are equal"
                                    safe = .false.
                                    goto 40
                                end if
                            end if

                            print *, "Tmp:", tmp
                            print *, "Inc:", inc

                            if (abs(tmp) > 3 .or. abs(tmp) < 1) then
                                safe = .false.
                                print *, "not safe dif >3 or <1"
                                goto 40
                            end if

                            if ((tmp > 0 .and. inc == -1) .or. (tmp < 0 .and. inc == 1)) then
                                safe = .false.
                                print *, "inc/dec err"
                                goto 40
                            end if

                            lastNum = num_array(j)
                        end if
                    else
                        exit
                    end if
                    50  a = 5
                end do    



            45  if (safe) then
                    sum = sum + 1
                    !print *, "safe!"
                end if

                if (safe2) then
                    sum2 = sum2 + 1
                    print *, "safe2!"
                end if

                
                ! print *, n
            !print *, "Line:", trim(line)
        else
            print *, "Error"
        end if
    end do

    print *, "Safe:", sum
    print *, "Safe2:", sum2
    close(10)

    !print *, "input:"
    !do i = 1, rows
    !    print *, (matrix(i, j), j = 1, cols)
    !end do


end program hello
