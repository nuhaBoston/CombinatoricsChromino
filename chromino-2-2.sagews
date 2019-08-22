
import itertools

def takeFourth(elem):
    return elem[3]

#bag with c colors, tiles of length 3
def bag(c):
    B=[]
    for i in range(11,c+11):
        for j in range(11,c+11):
            for k in range(i,c+11):
                if (i == j):
                    l = 2
                if (j == k):
                    l = 2
                if (i == k):
                    l = 2
                if (i == j) and (j == k):
                    l = 3
                if (i != j) and (j != k) and (i != k):
                    l = 1
                B.append([i,j,k,l])
    return B

len(bag(5))
bag(5)


from random import shuffle


def triples(L1,L2,L3):
    shuffle(L1)
    shuffle(L2)
    shuffle(L3)
    for i in range(0, len(L1)):
        for j in range(0, len(L2)):
            for k in range(0,len(L3)):
                yield i,j,k

def pairs(L1,L2):
    shuffle(L1)
    shuffle(L2)
    for i in range(0, len(L1)):
        for j in range(0, len(L2)):
            yield i,j


def leftright(P,boardlist,tile,i,j):
    count=0
    #if boardlist[i][j-1]>0 and boardlist[i][j-1]==P[tile][0] and boardlist[i-1][j]>0 and boardlist[i-1][j]==P[tile][0]:
        #count=count+5000
    #if boardlist[i][j-1]>0 and boardlist[i][j-1]==P[tile][0] and boardlist[i+1][j]>0 and boardlist[i+1][j]==P[tile][0]:
        #count=count+5000
    #if boardlist[i-1][j]>0 and boardlist[i-1][j]==P[tile][2] and boardlist[i][j+1]>0 and boardlist[i][j+1]==P[tile][2]:
        #count=count+5000
    #if boardlist[i+1][j]>0 and boardlist[i+1][j]==P[tile][2] and boardlist[i][j+1]>0 and boardlist[i][j+1]==P[tile][2]:
        #count=count+5000
    if boardlist[i][j-1]>0 and boardlist[i][j-1]!=P[tile][0]:
        count=count-100
    if boardlist[i-1][j]>0 and boardlist[i-1][j]!=P[tile][0]:
        count=count-100
    if boardlist[i-1][j+1]>0 and boardlist[i-1][j+1]!=P[tile][1]:
        count=count-100
    if boardlist[i-1][j+2]>0 and boardlist[i-1][j+2]!=P[tile][2]:
        count=count-100
    if boardlist[i+1][j]>0 and boardlist[i+1][j]!=P[tile][0]:
        count=count-100
    if boardlist[i+1][j+1]>0 and boardlist[i+1][j+1]!=P[tile][1]:
        count=count-100
    if boardlist[i+1][j+2]>0 and boardlist[i+1][j+2]!=P[tile][2]:
        count=count-100
    if boardlist[i][j+3]>0 and boardlist[i][j+3]!=P[tile][2]:
        count=count-100
    if boardlist[i][j-1]>0 and boardlist[i][j-1]==P[tile][0]:
        count=count+1
    if boardlist[i-1][j]>0 and boardlist[i-1][j]==P[tile][0]:
        count=count+1
    if boardlist[i-1][j+1]>0 and boardlist[i-1][j+1]==P[tile][1]:
        count=count+1
    if boardlist[i-1][j+2]>0 and boardlist[i-1][j+2]==P[tile][2]:
        count=count+1
    if boardlist[i+1][j]>0 and boardlist[i+1][j]==P[tile][0]:
        count=count+1
    if boardlist[i+1][j+1]>0 and boardlist[i+1][j+1]==P[tile][1]:
        count=count+1
    if boardlist[i+1][j+2]>0 and boardlist[i+1][j+2]==P[tile][2]:
        count=count+1
    if boardlist[i][j+3]>0 and boardlist[i][j+3]==P[tile][2]:
        count=count+1
    return count

def rightleft(P,boardlist,tile,i,j):
    count=0
    #if boardlist[i][j-1]>0 and boardlist[i][j-1]==P[tile][2] and boardlist[i-1][j]>0 and boardlist[i-1][j]==P[tile][2]:
        #count=count+5000
    #if boardlist[i][j-1]>0 and boardlist[i][j-1]==P[tile][2] and boardlist[i+1][j]>0 and boardlist[i+1][j]==P[tile][2]:
        #count=count+5000
    #if boardlist[i-1][j]>0 and boardlist[i-1][j]==P[tile][0] and boardlist[i][j+1]>0 and boardlist[i][j+1]==P[tile][0]:
        #count=count+5000
    #if boardlist[i+1][j]>0 and boardlist[i+1][j]==P[tile][0] and boardlist[i][j+1]>0 and boardlist[i][j+1]==P[tile][0]:
        #count=count+5000
    if boardlist[i][j-1]>0 and boardlist[i][j-1]!=P[tile][2]:
        count=count-100
    if boardlist[i-1][j]>0 and boardlist[i-1][j]!=P[tile][2]:
        count=count-100
    if boardlist[i-1][j+1]>0 and boardlist[i-1][j+1]!=P[tile][1]:
        count=count-100
    if boardlist[i-1][j+2]>0 and boardlist[i-1][j+2]!=P[tile][0]:
        count=count-100
    if boardlist[i+1][j]>0 and boardlist[i+1][j]!=P[tile][2]:
        count=count-100
    if boardlist[i+1][j+1]>0 and boardlist[i+1][j+1]!=P[tile][1]:
        count=count-100
    if boardlist[i+1][j+2]>0 and boardlist[i+1][j+2]!=P[tile][0]:
        count=count-100
    if boardlist[i][j+3]>0 and boardlist[i][j+3]!=P[tile][0]:
        count=count-100
    if boardlist[i][j-1]>0 and boardlist[i][j-1]==P[tile][2]:
        count=count+1
    if boardlist[i-1][j]>0 and boardlist[i-1][j]==P[tile][2]:
        count=count+1
    if boardlist[i-1][j+1]>0 and boardlist[i-1][j+1]==P[tile][1]:
        count=count+1
    if boardlist[i-1][j+2]>0 and boardlist[i-1][j+2]==P[tile][0]:
        count=count+1
    if boardlist[i+1][j]>0 and boardlist[i+1][j]==P[tile][2]:
        count=count+1
    if boardlist[i+1][j+1]>0 and boardlist[i+1][j+1]==P[tile][1]:
        count=count+1
    if boardlist[i+1][j+2]>0 and boardlist[i+1][j+2]==P[tile][0]:
        count=count+1
    if boardlist[i][j+3]>0 and boardlist[i][j+3]==P[tile][0]:
        count=count+1
    return count

def topbottom(P,boardlist,tile,i,j):
    count=0
    if boardlist[i-1][j]>0 and boardlist[i-1][j]!=P[tile][0]:
        count=count-100
    if boardlist[i][j-1]>0 and boardlist[i][j-1]!=P[tile][0]:
        count=count-100
    if boardlist[i+1][j-1]>0 and boardlist[i+1][j-1]!=P[tile][1]:
        count=count-100
    if boardlist[i+2][j-1]>0 and boardlist[i+2][j-1]!=P[tile][2]:
        count=count-100
    if boardlist[i][j+1]>0 and boardlist[i][j+1]!=P[tile][0]:
        count=count-100
    if boardlist[i+1][j+1]>0 and boardlist[i+1][j+1]!=P[tile][1]:
        count=count-100
    if boardlist[i+2][j+1]>0 and boardlist[i+2][j+1]!=P[tile][2]:
        count=count-100
    if boardlist[i+3][j]>0 and boardlist[i+3][j]!=P[tile][2]:
        count=count-100
    if boardlist[i-1][j]>0 and boardlist[i-1][j]==P[tile][0]:
        count=count+1
    if boardlist[i][j-1]>0 and boardlist[i][j-1]==P[tile][0]:
        count=count+1
    if boardlist[i+1][j-1]>0 and boardlist[i+1][j-1]==P[tile][1]:
        count=count+1
    if boardlist[i+2][j-1]>0 and boardlist[i+2][j-1]==P[tile][2]:
        count=count+1
    if boardlist[i][j+1]>0 and boardlist[i][j+1]==P[tile][0]:
        count=count+1
    if boardlist[i+1][j+1]>0 and boardlist[i+1][j+1]==P[tile][1]:
        count=count+1
    if boardlist[i+2][j+1]>0 and boardlist[i+2][j+1]==P[tile][2]:
        count=count+1
    if boardlist[i+3][j]>0 and boardlist[i+3][j]==P[tile][2]:
        count=count+1
    return count

def bottomtop(P,boardlist,tile,i,j):
    count=0
    if boardlist[i-1][j]>0 and boardlist[i-1][j]!=P[tile][2]:
        count=count-100
    if boardlist[i][j-1]>0 and boardlist[i][j-1]!=P[tile][2]:
        count=count-100
    if boardlist[i+1][j-1]>0 and boardlist[i+1][j-1]!=P[tile][1]:
        count=count-100
    if boardlist[i+2][j-1]>0 and boardlist[i+2][j-1]!=P[tile][0]:
        count=count-100
    if boardlist[i][j+1]>0 and boardlist[i][j+1]!=P[tile][2]:
        count=count-100
    if boardlist[i+1][j+1]>0 and boardlist[i+1][j+1]!=P[tile][1]:
        count=count-100
    if boardlist[i+2][j+1]>0 and boardlist[i+2][j+1]!=P[tile][0]:
        count=count-100
    if boardlist[i+3][j]>0 and boardlist[i+3][j]!=P[tile][0]:
        count=count-100
    if boardlist[i-1][j]>0 and boardlist[i-1][j]==P[tile][2]:
        count=count+1
    if boardlist[i][j-1]>0 and boardlist[i][j-1]==P[tile][2]:
        count=count+1
    if boardlist[i+1][j-1]>0 and boardlist[i+1][j-1]==P[tile][1]:
        count=count+1
    if boardlist[i+2][j-1]>0 and boardlist[i+2][j-1]==P[tile][0]:
        count=count+1
    if boardlist[i][j+1]>0 and boardlist[i][j+1]==P[tile][2]:
        count=count+1
    if boardlist[i+1][j+1]>0 and boardlist[i+1][j+1]==P[tile][1]:
        count=count+1
    if boardlist[i+2][j+1]>0 and boardlist[i+2][j+1]==P[tile][0]:
        count=count+1
    if boardlist[i+3][j]>0 and boardlist[i+3][j]==P[tile][0]:
        count=count+1
    return count


def boardupdateleftright(P,boardlist,tile,i,j):
    boardlist[i][j]=P[tile][0]
    boardlist[i][j+1]=P[tile][1]
    boardlist[i][j+2]=P[tile][2]
    if boardlist[i-1][j]==0:
        boardlist[i-1][j]=-1
    if boardlist[i-1][j+1]==0:
        boardlist[i-1][j+1]=-1
    if boardlist[i-1][j+2]==0:
        boardlist[i-1][j+2]=-1
    if boardlist[i+1][j]==0:
        boardlist[i+1][j]=-1
    if boardlist[i+1][j+1]==0:
        boardlist[i+1][j+1]=-1
    if boardlist[i+1][j+2]==0:
        boardlist[i+1][j+2]=-1
    if boardlist[i][j-1]==0:
        boardlist[i][j-1]=-1
    if boardlist[i][j+3]==0:
        boardlist[i][j+3]=-1
    #change size of board
    if i<=3:
        newrow=[0 for elt in range(0,len(boardlist[0]))]
        boardlist.insert(0,newrow)
    if i>=len(boardlist)-4:
        newrow=[0 for elt in range(0,len(boardlist[0]))]
        boardlist.append(newrow)
    if j<=3:
        for l in range(0,4-j):
            for k in range(0,len(boardlist)):
                boardlist[k].insert(0,0)
    if j>=len(boardlist[0])-6:
        for l in range(0,j-len(boardlist[0])+7):
            for k in range(0,len(boardlist)):
                boardlist[k].append(0)
    return boardlist

def boardupdaterightleft(P,boardlist,tile,i,j):
    boardlist[i][j]=P[tile][2]
    boardlist[i][j+1]=P[tile][1]
    boardlist[i][j+2]=P[tile][0]
    if boardlist[i-1][j]==0:
        boardlist[i-1][j]=-1
    if boardlist[i-1][j+1]==0:
        boardlist[i-1][j+1]=-1
    if boardlist[i-1][j+2]==0:
        boardlist[i-1][j+2]=-1
    if boardlist[i+1][j]==0:
        boardlist[i+1][j]=-1
    if boardlist[i+1][j+1]==0:
        boardlist[i+1][j+1]=-1
    if boardlist[i+1][j+2]==0:
        boardlist[i+1][j+2]=-1
    if boardlist[i][j-1]==0:
        boardlist[i][j-1]=-1
    if boardlist[i][j+3]==0:
        boardlist[i][j+3]=-1
    #change size of board
    if i<=3:
        newrow=[0 for elt in range(0,len(boardlist[0]))]
        boardlist.insert(0,newrow)
    if i>=len(boardlist)-4:
        newrow=[0 for elt in range(0,len(boardlist[0]))]
        boardlist.append(newrow)
    if j<=3:
        for l in range(0,4-j):
            for k in range(0,len(boardlist)):
                boardlist[k].insert(0,0)
    if j>=len(boardlist[0])-6:
        for l in range(0,j-len(boardlist[0])+7):
            for k in range(0,len(boardlist)):
                boardlist[k].append(0)
    return boardlist

def boardupdatetopbottom(P,boardlist,tile,i,j):
    boardlist[i][j]=P[tile][0]
    boardlist[i+1][j]=P[tile][1]
    boardlist[i+2][j]=P[tile][2]
    if boardlist[i][j-1]==0:
        boardlist[i][j-1]=-1
    if boardlist[i+1][j-1]==0:
        boardlist[i+1][j-1]=-1
    if boardlist[i+2][j-1]==0:
        boardlist[i+2][j-1]=-1
    if boardlist[i][j+1]==0:
        boardlist[i][j+1]=-1
    if boardlist[i+1][j+1]==0:
        boardlist[i+1][j+1]=-1
    if boardlist[i+2][j+1]==0:
        boardlist[i+2][j+1]=-1
    if boardlist[i-1][j]==0:
        boardlist[i-1][j]=-1
    if boardlist[i+3][j]==0:
        boardlist[i+3][j]=-1
    #change size of board
    if i<=3:
        for l in range(0,4-i):
            newrow=[0 for elt in range(0,len(boardlist[0]))]
            boardlist.insert(0,newrow)
    if i>=len(boardlist)-6:
        for l in range(0,i-len(boardlist)+7):
            newrow=[0 for elt in range(0,len(boardlist[0]))]
            boardlist.append(newrow)
    if j<=3:
        for k in range(0,len(boardlist)):
            boardlist[k].insert(0,0)
    if j>=len(boardlist[0])-4:
        for k in range(0,len(boardlist)):
            boardlist[k].append(0)
    return boardlist

def boardupdatebottomtop(P,boardlist,tile,i,j):
    boardlist[i][j]=P[tile][2]
    boardlist[i+1][j]=P[tile][1]
    boardlist[i+2][j]=P[tile][0]
    if boardlist[i][j-1]==0:
        boardlist[i][j-1]=-1
    if boardlist[i+1][j-1]==0:
        boardlist[i+1][j-1]=-1
    if boardlist[i+2][j-1]==0:
        boardlist[i+2][j-1]=-1
    if boardlist[i][j+1]==0:
        boardlist[i][j+1]=-1
    if boardlist[i+1][j+1]==0:
        boardlist[i+1][j+1]=-1
    if boardlist[i+2][j+1]==0:
        boardlist[i+2][j+1]=-1
    if boardlist[i-1][j]==0:
        boardlist[i-1][j]=-1
    if boardlist[i+3][j]==0:
        boardlist[i+3][j]=-1
    #change size of board
    if i<=3:
        for l in range(0,4-i):
            newrow=[0 for elt in range(0,len(boardlist[0]))]
            boardlist.insert(0,newrow)
    if i>=len(boardlist)-6:
        for l in range(0,i-len(boardlist)+7):
            newrow=[0 for elt in range(0,len(boardlist[0]))]
            boardlist.append(newrow)
    if j<=3:
        for k in range(0,len(boardlist)):
            boardlist[k].insert(0,0)
    if j>=len(boardlist[0])-4:
        for k in range(0,len(boardlist)):
            boardlist[k].append(0)
    return boardlist

def spots(boardlist):
    spots=[]
    for i in range(0,len(boardlist)-2):
        for j in range(0,len(boardlist[i])-2):
            #horizontally
            if boardlist[i][j]+boardlist[i][j+1]+boardlist[i][j+2]<=-1:
                spots.append([i,j])
            #vertically
            if boardlist[i][j]+boardlist[i+1][j]+boardlist[i+2][j]<=-1:
                spots.append([i,j])
    return spots
def spotshv(boardlist):
    vertical=[]
    horizontal=[]
    spotshv=[horizontal,vertical]
    for i in range(0,len(boardlist)-2):
        for j in range(0,len(boardlist[i])-2):
            #horizontally
            if boardlist[i][j]+boardlist[i][j+1]+boardlist[i][j+2]<=-1:
                spotshv[0].append([i,j])
            #vertically
            if boardlist[i][j]+boardlist[i+1][j]+boardlist[i+2][j]<=-1:
                spotshv[1].append([i,j])
    return spotshv
︡087b668f-8630-46b2-b353-e876e459f840︡{"done":true}
︠625338cc-36ca-4522-baa1-55f6a608e748s︠


def turn(P,boardlist,B):
    shuffle(P)
#    print 'Hand', P
    p=len(P)
    S=spots(boardlist)
    Shv=spotshv(boardlist)
    #this is sorting the card deck by how many colors are the same
#    P.sort(key = takeFourth, reverse = True)
#    print P
    for tile, spot, config in triples(P,S,[0,1,2,3]):
        #config 0 is left to right, config 1 right to left, config 2 top to bottom, config 3 bottom to top
        i=S[spot][0]
        j=S[spot][1]
        #check if can play the tile horizontally left to right
        if config==0 and S[spot] in Shv[0]:
            if leftright(P,boardlist,tile,i,j)>=2:
#                print P[tile], 'is played leftright at', i, j
                boardlist=boardupdateleftright(P,boardlist,tile,i,j)
                del P[tile]
                break
        if config==1 and S[spot] in Shv[0]:
            if rightleft(P,boardlist,tile,i,j)>=2:
#                print P[tile], 'is played rightleft at', i, j
                boardlist=boardupdaterightleft(P,boardlist,tile,i,j)
                del P[tile]
                break
        if config==2 and S[spot] in Shv[1]:
            if topbottom(P,boardlist,tile,i,j)>=2:
#                print P[tile], 'is played topbottom at', i, j
                boardlist=boardupdatetopbottom(P,boardlist,tile,i,j)
                del P[tile]
                break
        if config==3 and S[spot] in Shv[1]:
            if bottomtop(P,boardlist,tile,i,j)>=2:
#                print P[tile], 'is played bottomtop at', i, j
                boardlist=boardupdatebottomtop(P,boardlist,tile,i,j)
                del P[tile]
                break
    if p==len(P):
        #get a random number to draw a tile from the bag
        a=random.choice([i for i in range(0,len(B))])
        drawntile=B[a]
        #add to the players set
        P.append(drawntile)
        #delete it from the bag
        del B[a]
        #check to see if P1 can play the new tile
        for spot, config in pairs(S,[0,1,2,3]):
            tile=P.index(drawntile)
            #config 0 is left to right, config 1 right to left, config 2 top to bottom, config 3 bottom to top
            i=S[spot][0]
            j=S[spot][1]
            #check if can play the tile horizontally left to right
            if config==0 and S[spot] in Shv[0]:
                if leftright(P,boardlist,tile,i,j)>=2:
#                    print 'new drawn tile played leftright immediately', P[tile],'at', i, j
                    boardlist=boardupdateleftright(P,boardlist,tile,i,j)
                    del P[tile]
                    break
            if config==1 and S[spot] in Shv[0]:
                if rightleft(P,boardlist,-1,i,j)>=2:
#                    print 'new drawn tile played rightleft immediately', P[tile], 'at', i, j
                    boardlist=boardupdaterightleft(P,boardlist,tile,i,j)
                    del P[tile]
                    break
            if config==2 and S[spot] in Shv[1]:
                if topbottom(P,boardlist,tile,i,j)>=2:
#                    print 'new drawn tile played topbottom immediately', P[tile],'at', i, j
                    boardlist=boardupdatetopbottom(P,boardlist,tile,i,j)
                    del P[tile]
                    break
            if config==3 and S[spot] in Shv[1]:
                if bottomtop(P,boardlist,-1,i,j)>=2:
#                    print 'new drawn tile played bottomtop immediately', P[tile], 'at', i, j
                    boardlist=boardupdatebottomtop(P,boardlist,tile,i,j)
                    del P[tile]
                    break
#    if p==len(P)-1:
#        print 'a new tile that could not be played was drawn', P[tile]
    return [P,boardlist,B]

def turn1(P,boardlist,B):
    shuffle(P)
#    print 'Hand', P
    p=len(P)
    S=spots(boardlist)
    Shv=spotshv(boardlist)
    #this is sorting the card deck by how many colors are the same
    #P.sort(key = takeFourth, reverse = True)
    for tile, spot, config in triples(P,S,[0,1,2,3]):
        #config 0 is left to right, config 1 right to left, config 2 top to bottom, config 3 bottom to top
        i=S[spot][0]
        j=S[spot][1]
        #check if can play the tile horizontally left to right
        if config==0 and S[spot] in Shv[0]:
            if leftright(P,boardlist,tile,i,j)>=5000:
#                print P[tile], 'is played leftright at', i, j
                boardlist=boardupdateleftright(P,boardlist,tile,i,j)
                del P[tile]
                break
            elif leftright(P,boardlist,tile,i,j)>=2 and leftright(P,boardlist,tile,i,j)<=4999:
#                print P[tile], 'is played leftright at', i, j
                boardlist=boardupdateleftright(P,boardlist,tile,i,j)
                del P[tile]
                break
        if config==1 and S[spot] in Shv[0]:
            if rightleft(P,boardlist,tile,i,j)>=5000:
#                print P[tile], 'is played rightleft at', i, j
                boardlist=boardupdaterightleft(P,boardlist,tile,i,j)
                del P[tile]
                break
            elif rightleft(P,boardlist,tile,i,j)>=2 and rightleft(P,boardlist,tile,i,j)<=4999:
#                print P[tile], 'is played rightleft at', i, j
                boardlist=boardupdaterightleft(P,boardlist,tile,i,j)
                del P[tile]
                break
        if config==2 and S[spot] in Shv[1]:
            if topbottom(P,boardlist,tile,i,j)>=2:
#                print P[tile], 'is played topbottom at', i, j
                boardlist=boardupdatetopbottom(P,boardlist,tile,i,j)
                del P[tile]
                break
        if config==3 and S[spot] in Shv[1]:
            if bottomtop(P,boardlist,tile,i,j)>=2:
#                print P[tile], 'is played bottomtop at', i, j
                boardlist=boardupdatebottomtop(P,boardlist,tile,i,j)
                del P[tile]
                break
    if p==len(P):
        #get a random number to draw a tile from the bag
        a=random.choice([i for i in range(0,len(B))])
        drawntile=B[a]
        #add to the players set
        P.append(drawntile)
        #delete it from the bag
        del B[a]
        #check to see if P1 can play the new tile
        for spot, config in pairs(S,[0,1,2,3]):
            tile=P.index(drawntile)
            #config 0 is left to right, config 1 right to left, config 2 top to bottom, config 3 bottom to top
            i=S[spot][0]
            j=S[spot][1]
            #check if can play the tile horizontally left to right
            if config==0 and S[spot] in Shv[0]:
                if leftright(P,boardlist,tile,i,j)>=5000:
#                    print 'new drawn tile played leftright immediately', P[tile],'at', i, j
                    boardlist=boardupdateleftright(P,boardlist,tile,i,j)
                    del P[tile]
                    break
                elif leftright(P,boardlist,tile,i,j)>=2 and leftright(P,boardlist,tile,i,j)<=4999:
#                    print 'new drawn tile played leftright immediately', P[tile],'at', i, j
                    boardlist=boardupdateleftright(P,boardlist,tile,i,j)
                    del P[tile]
                    break
            if config==1 and S[spot] in Shv[0]:
                if rightleft(P,boardlist,-1,i,j)>=5000:
#                    print 'new drawn tile played rightleft immediately', P[tile], 'at', i, j
                    boardlist=boardupdaterightleft(P,boardlist,tile,i,j)
                    del P[tile]
                    break
                elif rightleft(P,boardlist,-1,i,j)>=2 and rightleft(P,boardlist,-1,i,j)<=4999:
#                    print 'new drawn tile played rightleft immediately', P[tile], 'at', i, j
                    boardlist=boardupdaterightleft(P,boardlist,tile,i,j)
                    del P[tile]
                    break
            if config==2 and S[spot] in Shv[1]:
                if topbottom(P,boardlist,tile,i,j)>=2:
#                    print 'new drawn tile played topbottom immediately', P[tile],'at', i, j
                    boardlist=boardupdatetopbottom(P,boardlist,tile,i,j)
                    del P[tile]
                    break
            if config==3 and S[spot] in Shv[1]:
                if bottomtop(P,boardlist,-1,i,j)>=2:
#                    print 'new drawn tile played bottomtop immediately', P[tile], 'at', i, j
                    boardlist=boardupdatebottomtop(P,boardlist,tile,i,j)
                    del P[tile]
                    break
#    if p==len(P)-1:
#        print 'a new tile that could not be played was drawn', P[tile]
    return [P,boardlist,B]

import random
def moreconcisegame(c):
#    print 'original input'
    B=[element for element in bag(5)]
    a=random.choice([i for i in range(0,len(B))])
    inittile=B[a]
#    print 'initial tile'
#    print inittile
#    print type(inittile[0])
    del B[a]
    P1=[]
    P2=[]
    for i in range(0,8):
        b=random.choice([i for i in range(0,len(B))])
        P1.append(B[b])
        del B[b]
#    print 'player 1'
#    print P1
    for i in range(0,8):
        b=random.choice([i for i in range(0,len(B))])
        P2.append(B[b])
        del B[b]
#    print 'player 2'
#    print P2
#    print 'bag'
#    print B
    boardlist=[[0,0,0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0,0,0],[0,0,0,0,-1,-1,-1,0,0,0,0],[0,0,0,-1,int(inittile[0]),int(inittile[1]),int(inittile[2]),-1,0,0,0],[0,0,0,0,-1,-1,-1,0,0,0,0],[0,0,0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0,0,0]]
    board=matrix(boardlist)
    #print board
    counter=0
    while len(P1)!=0 and len(P2)!=0:
        #print 'player 1 plays'
        L1=turn(P1,boardlist,B)
        P1=L1[0]
        boardlist=L1[1]
        board=matrix(boardlist)
        B=L1[2]
        counter=counter+1
        #print board
        if len(P1)==0:
            print 'P1 won by', len(P2), 'in', counter, 'rounds with', len(B), 'tiles left in bag on a', len(boardlist)-6, 'by', len(boardlist[0])-6, 'board'
            f.write('01; ' + str(len(P2))+"; "+ str(counter) + '; ' + str(len(B)) + '; ' + str(len(boardlist)-6) +' X '+ str(len(boardlist[0])-6) + ';\n')
            break
        if len(B)==0:
            print 'draw'
            f.write('draw; ' + str(counter)+'; '+ str(len(B))+ '; '+ str(len(boardlist)-6) + 'X '+ str(len(boardlist[0])-6)+';\n')
            break
        #print 'player 2 plays'
        L2=turn(P2,boardlist,B)
        P2=L2[0]
        boardlist=L2[1]
        board=matrix(boardlist)
        B=L2[2]
        counter=counter+1
        #print board
        if len(P2)==0:
            print 'P2 won by', len(P1), 'in', counter, 'rounds with', len(B), 'tiles left in bag on a', len(boardlist)-6, 'by', len(boardlist[0])-6, 'board'
            f.write('02; ' + str(len(P1))+'; ' + str(counter) + '; ' + str(len(B)) + '; ' + str(len(boardlist)-6) +' X '+ str(len(boardlist[0])-6) +';\n')
            break
        if len(B)==0:
            print 'draw;\n'
            f.write('draw; ' + str(counter)+'; '+ str(len(B))+ '; '+ str(len(boardlist)-6) + 'X '+ str(len(boardlist[0])-6)+';\n')
            break
    return None

sage_server.MAX_OUTPUT_MESSAGES = 3000
sage_server.MAX_OUTPUT = 1000000000

print sage_server.MAX_OUTPUT_MESSAGES



import csv
f=open("ChrominoStandard2000-41.csv", "w+")
f.write("Winner; #Tiles Won By; #Rounds; #Tiles Left in Bag; Size of Board;\n")





for i in range(0,1500):

    moreconcisegame(5)

f.close()


