import vfiles as veri
clock = 1
mem = [i for i in range(0, 256)]
reg = {'r0': 1, 'r1': 3, 'r2': 2, 'r3': 4, 'r4': 123, 'r5': 100, 'r6': 90, 'r7': 100, 'r8': 49,'r9':143}

mem[reg['r8']] = 3.5
mem[reg['r9']] = 4.5
print(mem[reg['r4']])
print(mem[reg['r5']])
print(mem[reg['r6']])
counter = 0
execFlags = [False, False, False, False, False]
fCounter = 0
dcounter = 0
exCounter = 0
wrcounter = 0
asflag = 0
msflag = 0
addinitialclock = 0
multinitialclock =0
dict = {}
readlist = []
onearr = []
flagA = 0
flagB = 0
finalans =[]


class score:
    def __init__(self, busy=None, ope=None, fi=None, fj=None, fk=None, qj=None, qk=None, rj=None, rk=None):
        self.busy = busy
        self.ope = ope
        self.fi = fi
        self.fj = fj
        self.fk = fk
        self.qj = qj
        self.qk = qk
        self.rj = rj
        self.rk = rk

    def __str__(self):
        return str("    "+str(self.busy)+"         "+str(self.ope)+"     "+str(self.fi)+"     "+str(self.fj)+"     "+str(self.fk)+"     "+str(self.qj)+"     "+str(self.qk)+"     "+str(self.rj)+"     "+str(self.rk))


class inst:
    def __init__(self, issue=None, read=None, execu=None, write=None):
        self.issue = issue
        self.read = read
        self.execu = execu
        self.write = write

    def __str__(self):
        return str("    "+str(self.issue)+"         "+str(self.read)+"     "+str(self.execu)+"     "+str(self.write))


def fuprint():
    print("Time name","    Busy    ", "    OP  ", "    Fi  ", "    Fj  ", "    Fk  ", "    Qj  ", "    Qk  ", "    Rj  ", "    Rk  ")
    print("fadd       "+str(fadd))
    print("Mult1      " + str(mult1))
    print("Mult2      " + str(mult2))
    print("Add        " + str(add))
    print("fmul     " + str(fmul))


def isprint():
    print("")
    print("Functional Unit Status: ")
    print("Inst  Fetch  Read  Execute WriteBack")
    for i in range(0, n):
        print(i+1, end=" ")
        print(str(op[i]))


fadd = score(busy="no")
mult1 = score(busy="no")
mult2 = score(busy="no")
add = score(busy="no")
fmul = score(busy="no")

opn = []
opr = []
op = []
fu = {}
readreg = {}
for i in range(0, 31):
    temp = 'r'+str(i)
    fu[temp] = None
    readreg[temp] = None
    # print(temp, fu[temp])
# print(fu)
n = int(input())                                   # Number of Instructions
flagarr = [False for i in range(0, n)]
listee = [0 for i in range(0, n)]
dflag = [0 for i in range(0, n)]
a = []
timelist = [None for i in range(0,n)]              # Time of Executions Array
for i in range(0, n):
    temp = list(map(str, input().split()))         # Instruction input Supported are ADD, FADD, MULT, FMUL
    opn.append(temp[0])
    opr.append(temp[1])
    a.append(temp)
    print(temp)
    temp[0] = inst(issue=None)
    op.append(temp[0])
    onearr.append(str(temp))

    # temp[0] = score(busy="No")
    # opname.append(temp[0])


def fetch():                                        # Issue phase
    global clock
    global fCounter
    global execFlags
    global timelist
    global fu
    print("buggy",fCounter)
    fi, fj, fk = opr[fCounter].split(sep=',')
    if op[fCounter].issue is None:                  # only if the instruction is not issued yet
        if fu[fi] is None:                          # WAW Checking
            readreg[fj] = fCounter
            readreg[fk] = fCounter
            if opn[fCounter] == "fadd":
                if fadd.busy == "no":
                    fadd.busy = "yes"
                    fadd.ope = "fadd"
                    fadd.fi = fi
                    fadd.fj = fj
                    fadd.fk = fk
                    fadd.qj = fu[fj]
                    fadd.qk = fu[fk]
                    if fu[fj] is None:
                        fadd.rj = "yes"
                        # add.rj = "yes"
                    if fu[fk] is None:
                        fadd.rk = "yes"
                        # add.rk = "yes"
                    print("hello bubu", fi, fu[fi], fj, fu[fj], fk, fu[fk])
                    fu[fi] = 'fadd'                 # Writing the functional register status as busy
                    op[fCounter].issue = clock
                    timelist[fCounter] = clock
                    execFlags[0] = True
                    if fCounter + 1 < n:            # next instruction is fetched only if present instruction is issued
                        fCounter = fCounter + 1
            elif opn[fCounter] == "mult":
                if mult1.busy == "no":
                    mult1.busy = "yes"
                    mult1.ope = "mult"
                    mult1.fi = fi
                    mult1.fj = fj
                    mult1.fk = fk
                    mult1.qj = fu[fj]
                    mult1.qk = fu[fk]

                    if fu[fj] is None:
                        mult1.rj = "yes"
                        # add.rj = "yes"
                    if fu[fk] is None:
                        mult1.rk = "yes"
                        # add.rk = "yes"
                    print("hello bubu", fi, fu[fi], fj, fu[fj], fk, fu[fk])
                    fu[fi] = 'mult'
                    op[fCounter].issue = clock
                    timelist[fCounter] = clock
                    execFlags[1] = True
                    if fCounter + 1 < n:
                        fCounter = fCounter + 1
            elif opn[fCounter] == "add":
                if add.busy == "no":
                    add.busy = "yes"
                    add.ope = "add"
                    add.fi = fi
                    add.fj = fj
                    add.fk = fk
                    add.qj = fu[fj]
                    add.qk = fu[fk]
                    if fu[fj] is None:
                        add.rj = "yes"
                        # mult1.rj = "yes"
                    if fu[fk] is None:
                        add.rk = "yes"
                        # mult1.rk = "yes"
                    fu[fi] = 'add'
                    op[fCounter].issue = clock
                    timelist[fCounter] = clock
                    execFlags[2] = True
                    if fCounter + 1 < n:
                        fCounter = fCounter + 1
            elif opn[fCounter] == "fmul":
                if fmul.busy == "no":
                    fmul.busy = "yes"
                    fmul.ope = "mult"
                    fmul.fi = fi
                    fmul.fj = fj
                    fmul.fk = fk
                    fmul.qj = fu[fj]
                    fmul.qk = fu[fk]
                    if fu[fj] is None:
                        fmul.rj = "yes"
                        # add.rj = "yes"
                    if fu[fk] is None:
                        fmul.rk = "yes"
                        # add.rk = "yes"
                    print("hello bubu", fi, fu[fi], fj, fu[fj], fk, fu[fk])
                    fu[fi] = 'fmul'
                    op[fCounter].issue = clock
                    timelist[fCounter] = clock
                    execFlags[4] = True
                    if fCounter + 1 < n:
                        fCounter = fCounter + 1


def decode():                                                    # Read phase
    global execFlags
    global dcounter
    global readlist
    global fu
    global flagA
    global flagB
    dlist = []
    temper = -1
    fi, fj, fk = opr[dcounter].split(sep=',')
    fi2 = 0
    # if fu[fj] is not None or fu[fk] is not None:
    for i in range(0, n):
        if op[i].issue is not None and op[i].read is None: # running a loop to get the list of instructions that have to be read
            dlist.append(i)
    for bu in dlist:
        dcounter = bu
        print("king", fj, fk,fu[fj], fu[fk])
        if fu[fj] is not None or fu[fk] is not None:
            if dcounter != 0 and dcounter !=n:
                print("I am dead")
                print("jbu", opn[dcounter])
                fi1, fj1, fk1 = opr[dcounter].split(sep=',')
                for i in range(dcounter+1, n):
                    fi2, fj2, fk2 = opr[i].split(sep=',')
                    print(fi2, fj1)
                    if timelist[i] == clock and fi2 == fj1:
                        # fu[fi2] = None
                        temper = i
                        flagA = 1
                        print("mumu",dcounter, fi1,fi2 )
                    if timelist[i] == clock and fi2 == fk1:
                        # fu[fi2] = None
                        temper = i
                        flagB = 1
                    if flagA == 1 or flagB == 1:
                         # if fi1 != fj2:
                            fu[fi2] = None
                            if flagA == 1:
                                if opn[i] == "add":
                                    add.rj = "yes"
                                if opn[i] == "mult":
                                    mult1.rj = "yes"
                                    print("screw")
                            if flagB == 1:
                                if opn[i] == "add":
                                    add.rk = "yes"
                                if opn[i] == "mult":
                                    mult1.rk = "yes"
                                    print("hmmm")
        if op[dcounter].read is None and op[dcounter].issue is not None:
            if opn[dcounter] == "fadd" and execFlags[0] is False:
                execFlags[0] = True
                fi, fj, fk = opr[dcounter].split(sep=',')
                print("okay fine", dcounter, op[dcounter].issue)
                if op[dcounter].issue is not None:
                    print("faddyy", fadd.fj, fadd.fk, fu[fadd.fj], fu[fadd.fk], fadd.rj, fadd.rk)
                    if fu[fadd.fj] is None:
                        fadd.rj = "yes"
                    if fu[fadd.fk] is None:
                        fadd.rk = "yes"
                    print("faddyy rj rj", fadd.rj, fadd.rk)
                    if fadd.rk == "yes" and fadd.rj == "yes":
                        op[dcounter].read = clock
                        if flagA == 1 or flagB == 1 and temper != -1:
                            fu[temper] = "busy"
                            flagA = 0
                            flagB = 0
                        try:
                            readlist.remove(fk)
                        except ValueError:
                            print("not found it")
                        try:
                            readlist.remove(fj)
                        except ValueError:
                            print("not found it")
                        dflag[dcounter] = 1
                        # if dcounter + 1 < n:
                        #     dcounter = dcounter + 1
            elif opn[dcounter] == "mult" and execFlags[1] is False:
                execFlags[1] = True
                fi, fj, fk = opr[dcounter].split(sep=',')
                print("okay fine", dcounter, op[dcounter].issue)
                if op[dcounter].issue is not None:
                    # mult1.ope = "mult"
                    # mult1.fi = fi
                    # mult1.fj = fj
                    # mult1.fk = fk
                    # mult1.qj = fu[fj]
                    # mult1.qk = fu[fk]
                    print("multy", mult1.fj, mult1.fk, fu[mult1.fj], fu[mult1.fk],mult1.rj,mult1.rk)
                    if fu[mult1.fj] is None:
                        mult1.rj = "yes"
                    if fu[mult1.fk] is None:
                        mult1.rk = "yes"
                    print("mult1 rj rj", mult1.rj, mult1.rk)
                    if mult1.rk == "yes" and mult1.rj == "yes":
                        op[dcounter].read = clock
                        if flagA == 1 or flagB == 1 and temper != -1:
                            fu[temper] = "busy"
                            flagA = 0
                            flagB = 0
                        try:
                            readlist.remove(fk)
                        except ValueError:
                            print("not found it")
                        try:
                            readlist.remove(fj)
                        except ValueError:
                            print("not found it")
                        dflag[dcounter] = 1
                        # if dcounter + 1 < n:
                        #     dcounter = dcounter + 1
            elif opn[dcounter] == "add" and execFlags[2] is False:
                execFlags[2] = True
                fi, fj, fk = opr[dcounter].split(sep=',')
                if op[dcounter].issue is not None:
                    # if add.qk is None and add.qj is None:
                    # add.busy = "yes"
                    # add.ope = "add"
                    # add.fi = fi
                    # add.fj = fj
                    # add.fk = fk
                    # add.qj = fu[fj]
                    # add.qk = fu[fk]
                    print("I am add answeeeeeeeeeeeee", add.rj, add.fk, fu[add.fj], fu[add.fk] , dcounter, opn[dcounter], execFlags[2])
                    if fu[add.fj] is None:
                        add.rj = "yes"
                    if fu[add.fk] is None:
                        add.rk = "yes"
                    print(add.rj,add.rk)
                    if add.rk == "yes" and add.rj == "yes":
                        op[dcounter].read = clock
                        if flagA == 1 or flagB == 1 and temper != -1:
                            fu[temper] = "busy"
                            flagA = 0
                            flagB = 0
                        try:
                            readlist.remove(fk)
                        except ValueError:
                            print("not found it")
                        try:
                            readlist.remove(fj)
                        except ValueError:
                            print("not found it")
                        dflag[dcounter] = 1
                        if dcounter + 1 < n:
                            dcounter = dcounter + 1
            elif op[dcounter].read is None and op[dcounter].issue is not None:
                print("lengthy", len(execFlags))
                print(execFlags)
                if opn[dcounter] == "fmul" and execFlags[4] is False:
                    execFlags[4] = True
                    fi, fj, fk = opr[dcounter].split(sep=',')
                    print("okay fine", dcounter, op[dcounter].issue)
                    if op[dcounter].issue is not None:
                        print("fmullyy", fmul.fj, fmul.fk, fu[fmul.fj], fu[fmul.fk], fmul.rj, fmul.rk)
                        if fu[fmul.fj] is None:
                            fmul.rj = "yes"
                        if fu[fmul.fk] is None:
                            fmul.rk = "yes"
                        print("faddyy rj rj", fmul.rj, fmul.rk)
                        if fmul.rk == "yes" and fmul.rj == "yes":
                            op[dcounter].read = clock
                            if flagA == 1 or flagB == 1 and temper != -1:
                                fu[temper] = "busy"
                                flagA = 0
                                flagB = 0
                            try:
                                readlist.remove(fk)
                            except ValueError:
                                print("not found it")
                            try:
                                readlist.remove(fj)
                            except ValueError:
                                print("not found it")
                            dflag[dcounter] = 1
                            # if dcounter + 1 < n:
                            #     dcounter = dcounter + 1


def execute():
    global clock
    global asflag
    global msflag
    global addinitialclock
    global multinitialclock
    global flagarr
    global listee
    global exCounter
    global fu
    finalclock = clock
    for i in range(0, n):
        # if op[i].issue == "yes":
        #     if op[i].read is not None and op[i].execu is None:
        #         listee.append(opn[i])
        if opn[i] == "add" and op[i].issue is not None and op[i].read is not None and op[i].execu is None:
            execFlags[2] = True
            if flagarr[i] is False:
                listee[i] = 5
                flagarr[i] = True
            else:
                listee[i] -= 1
                if listee[i] == 1:
                    op[i].execu = clock
                    flagarr[i] = False
                    fi, fj, fk = opr[i].split(sep=',')
                    print(fj,fk)
                    print(reg[fj],reg[fk])
                    print(mem[reg[fj]],mem[reg[fk]])
                    answer = veri.cla(str(mem[reg[fj]]), str(mem[reg[fk]]))
                    print("Answer for the add with inst number ", i, "is", answer)
                    answer = answer[0:33]
                    answer = list(answer)
                    bub = []
                    for vart in answer:
                        if vart.isalnum():
                            bub.append(vart)
                    print(bub)
                    bub = "".join(bub)
                    print(bub)
                    bub = int(bub)
                    bub = str(bub)
                    print(bub)
                    bub = int(bub, 2)
                    answer = bub
                    mem[reg[fi]] = answer
                    finalans.append(answer)
        elif opn[i] == "mult" and  op[i].issue is not None and op[i].read is not None and op[i].execu is None:
            execFlags[1] = True
            if flagarr[i] is False:
                listee[i] = 10
                flagarr[i] = True
            else:
                listee[i] -= 1
                if listee[i] == 1:
                    op[i].execu = clock
                    flagarr[i] = False
                    fi, fj, fk = opr[i].split(sep=',')
                    print(fj,fk)
                    answer = veri.wmul(str(mem[reg[fj]]), str(mem[reg[fk]]))
                    answer = list(answer)
                    b = []
                    for i in answer:
                        if i.isalnum():
                            b.append(i)
                    print(b)
                    b = "".join(b)
                    answer = b
                    print("Answer for the mul with inst number ", i, "is", answer)
                    finalans.append(answer)
        elif opn[i] == "fadd" and op[i].issue is not None and op[i].read is not None and op[i].execu is None:
            execFlags[0] = True
            if flagarr[i] is False:
                listee[i] = 15
                flagarr[i] = True
            else:
                listee[i] -= 1
                if listee[i] == 1:
                    op[i].execu = clock
                    flagarr[i] = False
                    fi, fj, fk = opr[i].split(sep=',')
                    print(fj, fk)
                    var1 = float(str(mem[reg[fj]]))
                    var2 = float(str(mem[reg[fk]]))
                    answer = veri.fpa(var1, var2)
                    print("Answer for the fadd with inst number ", i, "is", answer)
                    finalans.append(answer)
        elif opn[i] == "fmul" and op[i].issue is not None and op[i].read is not None and op[i].execu is None:
            execFlags[4] = True
            if flagarr[i] is False:
                listee[i] = 13
                flagarr[i] = True
            else:
                listee[i] -= 1
                if listee[i] == 1:
                    op[i].execu = clock
                    flagarr[i] = False
                    fi, fj, fk = opr[i].split(sep=',')
                    print(fj, fk)
                    answer = veri.fpm(str(mem[reg[fj]]), str(mem[reg[fk]]))
                    print("Answer for the fmul with inst number ", i, "is", answer)
                    finalans.append(answer)


    # if opn[exCounter] == "add" and execFlags[2] is False and op[exCounter].execu is None and op[exCounter].read is not None:
    #     if asflag == 0:
    #         addinitialclock = clock
    #         asflag = 1
    #     execFlags[2] = True
    #     if add.rj == "yes" and add.rk == "yes":
    #         if finalclock - addinitialclock == 5:
    #             print("result ", mem[reg[add.fj]] + mem[reg[add.fk]])
    #             op[exCounter].execu = clock
    #             if exCounter + 1 < n:
    #                 exCounter += 1
    #             asflag = 0
    # elif opn[exCounter] == "mult" and execFlags[1] is False and op[exCounter].execu is None and op[exCounter].read is not None:
    #     if msflag == 0:
    #         multinitialclock = clock
    #         msflag = 1
    #     execFlags[1] = True
    #     print("rj and rk of mukt1", mult1.rj,mult1.rk)
    #     if mult1.rj == "yes" and mult1.rk == "yes":
    #         if finalclock - multinitialclock == 8:
    #             print("result ", mem[reg[mult1.fj]] * mem[reg[mult1.fk]])
    #             op[exCounter].execu = clock
    #             if exCounter + 1 < n:
    #                 exCounter += 1
    #             msflag = 0

def termCheck():
    count = 0
    for i in range(0, n):
        if op[i].write is not None:
            count += 1
    if count == n:
        return False
    else:
        return True


def writeback():
    global clock
    global wrcounter
    global readlist
    global fu
    arr = []
    for i in range(0, n):
        if op[i].execu is not None and op[i].write is None:
            arr.append(i)
    for i in arr:
        wrcounter = i
        if opn[wrcounter] == "add" and execFlags[2] is False and op[wrcounter].write is None:
            execFlags[2] = True
            fi, fj, fk = opr[wrcounter].split(sep=',')
            if op[wrcounter].execu is not None:
                for i in range(0, wrcounter):
                    if op[i].issue is not None and op[i].read is None:
                        if opn[i] == "add":
                            readlist.append(add.fj)
                            readlist.append(add.fk)
                        if opn[i] == "mult":
                            readlist.append(mult1.fj)
                            readlist.append(mult1.fk)
                        if opn[i] == "fadd":
                            readlist.append(fadd.fj)
                            readlist.append(fadd.fk)
                if fi not in readlist:
                    fi, fj, fk = opr[wrcounter].split(sep=',')
                    fu[fi] = None
                    # fu[fj] = None
                    # fu[fk] = None
                    add.busy = "no"
                    add.ope = None
                    add.fi = None
                    add.fj = None
                    add.fk = None
                    add.qj = None
                    add.qk = None
                    add.rj = None
                    add.rk = None
                    op[wrcounter].write = clock
                    # if wrcounter + 1 < n:
                    #     wrcounter += 1
        elif opn[wrcounter] == "mult" and execFlags[1] is False and op[wrcounter].write is None:
            execFlags[1] = True
            fi, fj, fk = opr[wrcounter].split(sep=',')
            if op[wrcounter].execu is not None:
                for i in range(0, wrcounter):
                    if op[i].issue is not None and op[i].read is None:
                        if opn[i] == "add":
                            readlist.append(add.fj)
                            readlist.append(add.fk)
                        if opn[i] == "mult":
                            readlist.append(mult1.fj)
                            readlist.append(mult1.fk)
                        if opn[i] == "fadd":
                            readlist.append(fadd.fj)
                            readlist.append(fadd.fk)
                print("fiii", fi)
                print("Read list", readlist)
                if fi not in readlist:
                    fi, fj, fk = opr[wrcounter].split(sep=',')
                    fu[fi] = None
                    # fu[fj] = None
                    # fu[fk] = None
                    mult1.busy = "no"
                    mult1.ope = None
                    mult1.fi = None
                    mult1.fj = None
                    mult1.fk = None
                    mult1.qj = None
                    mult1.qk = None
                    mult1.rj = None
                    mult1.rk = None
                    op[wrcounter].write = clock
                    # if wrcounter + 1 < n:
                    #     wrcounter += 1
        elif opn[wrcounter] == "fadd" and execFlags[0] is False and op[wrcounter].write is None:
            execFlags[0] = True
            fi, fj, fk = opr[wrcounter].split(sep=',')
            if op[wrcounter].execu is not None:
                for i in range(0, wrcounter):
                    if op[i].issue is not None and op[i].read is None:
                        if opn[i] == "add":
                            readlist.append(add.fj)
                            readlist.append(add.fk)
                        if opn[i] == "mult":
                            readlist.append(mult1.fj)
                            readlist.append(mult1.fk)
                        if opn[i] == "fadd":
                            readlist.append(fadd.fj)
                            readlist.append(fadd.fk)
                if fi not in readlist:
                    fi, fj, fk = opr[wrcounter].split(sep=',')
                    fu[fi] = None
                    # fu[fj] = None
                    # fu[fk] = None
                    fadd.busy = "no"
                    fadd.ope = None
                    fadd.fi = None
                    fadd.fj = None
                    fadd.fk = None
                    fadd.qj = None
                    fadd.qk = None
                    fadd.rj = None
                    fadd.rk = None
                    op[wrcounter].write = clock
                    # if wrcounter + 1 < n:
                    #     wrcounter += 1
        elif opn[wrcounter] == "fmul" and execFlags[4] is False and op[wrcounter].write is None:
            execFlags[4] = True
            fi, fj, fk = opr[wrcounter].split(sep=',')
            if op[wrcounter].execu is not None:
                for i in range(0, wrcounter):
                    if op[i].issue is not None and op[i].read is None:
                        if opn[i] == "add":
                            readlist.append(add.fj)
                            readlist.append(add.fk)
                        if opn[i] == "mult":
                            readlist.append(mult1.fj)
                            readlist.append(mult1.fk)
                        if opn[i] == "fadd":
                            readlist.append(fadd.fj)
                            readlist.append(fadd.fk)
                        if opn[i] == "fmul":
                            readlist.append(fmul.fj)
                            readlist.append(fmul.fk)
                print("fiii", fi)
                print("Read list", readlist)
                if fi not in readlist:
                    fi, fj, fk = opr[wrcounter].split(sep=',')
                    fu[fi] = None
                    # fu[fj] = None
                    # fu[fk] = None
                    fmul.busy = "no"
                    fmul.ope = None
                    fmul.fi = None
                    fmul.fj = None
                    fmul.fk = None
                    fmul.qj = None
                    fmul.qk = None
                    fmul.rj = None
                    fmul.rk = None
                    op[wrcounter].write = clock
                    # if wrcounter + 1 < n:
                    #     wrcounter += 1
while clock < 100:
    print(clock, fu)
    fetch()
    print("After fetch", execFlags)
    decode()
    print("After decode", execFlags)
    execute()
    print("After execute", execFlags)
    writeback()
    print("After writeback", execFlags)
    fuprint()

    isprint()
    execFlags = [False, False, False, False, False]
    clock = clock + 1

print(finalans)

print(opn)
