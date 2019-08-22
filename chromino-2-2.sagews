︠ff2b73fd-65a1-4a92-8e07-cc4e1a03aceas︠

︡62fa9768-c7fc-4112-9e95-f5ab45b252e4︡{"done":true}
︠ed17b974-9f32-4546-9800-2c12509c3077s︠
︡7fbd0869-ee06-4f37-896e-152cc7f922b2︡{"done":true}
︠6cd45236-9546-499f-9073-cdd0f16c8b54s︠

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
︡90bbd1f7-8d48-4fe4-bb8f-835cb8a032b8︡{"done":true}
︠5d29529c-96f6-49b6-b0db-d5fca10f06bas︠
len(bag(5))
bag(5)

︡289c9985-9a04-40c6-b4ed-9d2b33a1b830︡{"stdout":"75\n"}︡{"stdout":"[[11, 11, 11, 3], [11, 11, 12, 2], [11, 11, 13, 2], [11, 11, 14, 2], [11, 11, 15, 2], [11, 12, 11, 2], [11, 12, 12, 2], [11, 12, 13, 1], [11, 12, 14, 1], [11, 12, 15, 1], [11, 13, 11, 2], [11, 13, 12, 1], [11, 13, 13, 2], [11, 13, 14, 1], [11, 13, 15, 1], [11, 14, 11, 2], [11, 14, 12, 1], [11, 14, 13, 1], [11, 14, 14, 2], [11, 14, 15, 1], [11, 15, 11, 2], [11, 15, 12, 1], [11, 15, 13, 1], [11, 15, 14, 1], [11, 15, 15, 2], [12, 11, 12, 2], [12, 11, 13, 1], [12, 11, 14, 1], [12, 11, 15, 1], [12, 12, 12, 3], [12, 12, 13, 2], [12, 12, 14, 2], [12, 12, 15, 2], [12, 13, 12, 2], [12, 13, 13, 2], [12, 13, 14, 1], [12, 13, 15, 1], [12, 14, 12, 2], [12, 14, 13, 1], [12, 14, 14, 2], [12, 14, 15, 1], [12, 15, 12, 2], [12, 15, 13, 1], [12, 15, 14, 1], [12, 15, 15, 2], [13, 11, 13, 2], [13, 11, 14, 1], [13, 11, 15, 1], [13, 12, 13, 2], [13, 12, 14, 1], [13, 12, 15, 1], [13, 13, 13, 3], [13, 13, 14, 2], [13, 13, 15, 2], [13, 14, 13, 2], [13, 14, 14, 2], [13, 14, 15, 1], [13, 15, 13, 2], [13, 15, 14, 1], [13, 15, 15, 2], [14, 11, 14, 2], [14, 11, 15, 1], [14, 12, 14, 2], [14, 12, 15, 1], [14, 13, 14, 2], [14, 13, 15, 1], [14, 14, 14, 3], [14, 14, 15, 2], [14, 15, 14, 2], [14, 15, 15, 2], [15, 11, 15, 2], [15, 12, 15, 2], [15, 13, 15, 2], [15, 14, 15, 2], [15, 15, 15, 3]]\n"}︡{"done":true}
︠df40a61e-503e-4550-bcba-689a6076322es︠
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
︡181a9cb8-b1f3-403e-ab1c-1420f3063f7a︡{"done":true}
︠5f299342-e0a9-4d57-9efe-d6668fd1d0eds︠

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


︡4d4c34e3-63fe-41ae-b0f3-ed86afa72aa4︡{"done":true}
︠832bb1a6-86d7-402d-9e2b-80d5ea528eb0s︠


︡efb40047-d3aa-4e35-96f9-5d28203c4a4a︡{"done":true}
︠1cb1cbe2-f699-479d-b638-2c8cafa13ca9s︠
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
︡3bc7a131-3542-4f76-913f-e1a1d382e2ad︡{"done":true}
︠a82de4e7-30d8-41fa-aab1-8a9900d1cddbs︠


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
︡ae8e76de-45a2-4439-81db-249a18724c7a︡{"done":true}
︠c56fc38d-92a4-495f-a05f-83c2e5fb4227s︠
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
︡5e2ddfe3-7ff5-4174-8f5d-5df7ef821251︡{"done":true}
︠769ec9ec-d9cf-4f09-9513-e47a0747cd43s︠

sage_server.MAX_OUTPUT_MESSAGES = 3000
sage_server.MAX_OUTPUT = 1000000000

print sage_server.MAX_OUTPUT_MESSAGES



︡5a311858-1d0a-475c-885c-0750425fe98d︡{"stdout":"3000\n"}︡{"done":true}
︠110e69cd-46f6-469b-98cf-6ccb70eae0a4s︠
import csv
f=open("ChrominoStandard2000-41.csv", "w+")
f.write("Winner; #Tiles Won By; #Rounds; #Tiles Left in Bag; Size of Board;\n")



︡515884e9-ab0f-4f0e-b37c-ebc3b262eb1e︡{"done":true}
︠8bb9f49e-e878-422d-9f16-61a6c9030f92s︠

︡cc472554-42c9-4989-9247-15226ab1c3ea︡{"done":true}
︠88444539-74bd-4352-ace5-75bdd2b8f5cesr︠


for i in range(0,1500):

    moreconcisegame(5)

f.close()
︡b7678b84-afd4-4655-b585-7fd1d28a7511︡{"stdout":"P1 won by"}︡{"stdout":" 1 in 43 rounds with 41 tiles left in bag on a 17 by 23 board\nP2 won by"}︡{"stdout":" 3 in 74 rounds with 18 tiles left in bag on a 25 by 20 board\nP1 won by"}︡{"stdout":" 1 in 87 rounds with 9 tiles left in bag on a 35 by 24 board\nP2 won by"}︡{"stdout":" 3 in 58 rounds with 29 tiles left in bag on a 24 by 16 board\nP2 won by"}︡{"stdout":" 1 in 18 rounds with 55 tiles left in bag on a 17 by 13 board\nP1 won by"}︡{"stdout":" 6 in 39 rounds with 41 tiles left in bag on a 16 by 21 board\nP2 won by"}︡{"stdout":" 2 in 90 rounds with 6 tiles left in bag on a 27 by 33 board\nP1 won by"}︡{"stdout":" 2 in 27 rounds with 50 tiles left in bag on a 13 by 17 board\nP2 won by"}︡{"stdout":" 5 in 44 rounds with 37 tiles left in bag on a 17 by 20 board\ndraw;\n"}︡{"stdout":"\nP2 won by"}︡{"stdout":" 1 in 28 rounds with 49 tiles left in bag on a 16 by 12 board\nP1 won by"}︡{"stdout":" 3 in 27 rounds with 49 tiles left in bag on a 20 by 16 board\nP1 won by"}︡{"stdout":" 4 in 33 rounds with 45 tiles left in bag on a 15 by 19 board\nP1 won by"}︡{"stdout":" 3 in 37 rounds with 44 tiles left in bag on a 15 by 23 board\nP2 won by"}︡{"stdout":" 5 in 38 rounds with 39 tiles left in bag on a 14 by 22 board\nP2 won by"}︡{"stdout":" 2 in 66 rounds with 24 tiles left in bag on a 18 by 24 board\nP2 won by"}︡{"stdout":" 3 in 66 rounds with 18 tiles left in bag on a 26 by 21 board\nP2 won by"}︡{"stdout":" 1 in 50 rounds with 35 tiles left in bag on a 19 by 19 board\nP2 won by"}︡{"stdout":" 4 in 60 rounds with 28 tiles left in bag on a 19 by 23 board\nP2 won by"}︡{"stdout":" 3 in 46 rounds with 35 tiles left in bag on a 22 by 18 board\nP2 won by"}︡{"stdout":" 1 in 32 rounds with 46 tiles left in bag on a 18 by 17 board\nP2 won by"}︡{"stdout":" 1 in 34 rounds with 46 tiles left in bag on a 14 by 19 board\ndraw;\n"}︡{"stdout":"\nP2 won by"}︡{"stdout":" 3 in 34 rounds with 44 tiles left in bag on a 21 by 15 board\nP1 won by"}︡{"stdout":" 5 in 21 rounds with 51 tiles left in bag on a 11 by 20 board\nP2 won by"}︡{"stdout":" 2 in 16 rounds with 56 tiles left in bag on a 13 by 12 board\nP1 won by"}︡{"stdout":" 2 in 23 rounds with 52 tiles left in bag on a 18 by 14 board\nP2 won by"}︡{"stdout":" 2 in 30 rounds with 46 tiles left in bag on a 17 by 17 board\nP1 won by"}︡{"stdout":" 2 in 81 rounds with 21 tiles left in bag on a 28 by 16 board\nP1 won by"}︡{"stdout":" 4 in 61 rounds with 27 tiles left in bag on a 19 by 20 board\ndraw"}︡{"stdout":"\nP2 won by"}︡{"stdout":" 3 in 50 rounds with 38 tiles left in bag on a 15 by 22 board\nP2 won by"}︡{"stdout":" 1 in 72 rounds with 24 tiles left in bag on a 30 by 21 board\nP2 won by"}︡{"stdout":" 2 in 24 rounds with 51 tiles left in bag on a 14 by 18 board\nP1 won by"}︡{"stdout":" 1 in 69 rounds with 23 tiles left in bag on a 18 by 26 board\nP2 won by"}︡{"stdout":" 4 in 60 rounds with 27 tiles left in bag on a 17 by 29 board\nP1 won by"}︡{"stdout":" 2 in 61 rounds with 29 tiles left in bag on a 24 by 20 board\nP2 won by"}︡{"stdout":" 2 in 30 rounds with 46 tiles left in bag on a 16 by 16 board\nP1 won by"}︡{"stdout":" 2 in 39 rounds with 41 tiles left in bag on a 16 by 22 board\nP2 won by"}︡{"stdout":" 3 in 82 rounds with 12 tiles left in bag on a 23 by 23 board\nP1 won by"}︡{"stdout":" 3 in 35 rounds with 44 tiles left in bag on a 14 by 24 board\nP2 won by"}︡{"stdout":" 3 in 58 rounds with 28 tiles left in bag on a 25 by 21 board\nP2 won by"}︡{"stdout":" 1 in 28 rounds with 50 tiles left in bag on a 12 by 23 board\nP1 won by"}︡{"stdout":" 3 in 65 rounds with 25 tiles left in bag on a 23 by 23 board\nP1 won by"}︡{"stdout":" 4 in 33 rounds with 45 tiles left in bag on a 14 by 17 board\nP2 won by"}︡{"stdout":" 1 in 58 rounds with 28 tiles left in bag on a 20 by 19 board\nP2 won by"}︡{"stdout":" 3 in 26 rounds with 50 tiles left in bag on a 16 by 14 board\nP1 won by"}︡{"stdout":" 3 in 59 rounds with 34 tiles left in bag on a 18 by 20 board\nP1 won by"}︡{"stdout":" 1 in 35 rounds with 44 tiles left in bag on a 17 by 23 board\nP1 won by"}︡{"stdout":" 2 in 61 rounds with 32 tiles left in bag on a 19 by 20 board\nP2 won by"}︡{"stdout":" 4 in 38 rounds with 40 tiles left in bag on a 16 by 18 board\nP1 won by"}︡{"stdout":" 3 in 39 rounds with 39 tiles left in bag on a 23 by 16 board\nP2 won by"}︡{"stdout":" 1 in 26 rounds with 51 tiles left in bag on a 15 by 14 board\nP2 won by"}︡{"stdout":" 1 in 66 rounds with 24 tiles left in bag on a 20 by 37 board\ndraw;\n"}︡{"stdout":"\nP1 won by"}︡{"stdout":" 1 in 55 rounds with 33 tiles left in bag on a 29 by 24 board\nP2 won by"}︡{"stdout":" 5 in 16 rounds with 55 tiles left in bag on a 12 by 11 board\nP1 won by"}︡{"stdout":" 3 in 67 rounds with 21 tiles left in bag on a 28 by 18 board\nP2 won by"}︡{"stdout":" 5 in 46 rounds with 35 tiles left in bag on a 22 by 17 board\nP2 won by"}︡{"stdout":" 2 in 76 rounds with 19 tiles left in bag on a 19 by 35 board\nP2 won by"}︡{"stdout":" 2 in 16 rounds with 57 tiles left in bag on a 12 by 15 board\nP1 won by"}︡{"stdout":" 3 in 73 rounds with 21 tiles left in bag on a 28 by 21 board\nP2 won by"}︡{"stdout":" 1 in 16 rounds with 57 tiles left in bag on a 15 by 12 board\nP2 won by"}︡{"stdout":" 5 in 40 rounds with 41 tiles left in bag on a 17 by 17 board\nP1 won by"}︡{"stdout":" 1 in 51 rounds with 36 tiles left in bag on a 22 by 17 board\nP1 won by"}︡{"stdout":" 1 in 45 rounds with 37 tiles left in bag on a 16 by 22 board\nP2 won by"}︡{"stdout":" 2 in 28 rounds with 47 tiles left in bag on a 17 by 17 board\nP2 won by"}︡{"stdout":" 1 in 48 rounds with 37 tiles left in bag on a 16 by 18 board\nP1 won by"}︡{"stdout":" 3 in 43 rounds with 38 tiles left in bag on a 23 by 18 board\nP2 won by"}︡{"stdout":" 2 in 78 rounds with 10 tiles left in bag on a 24 by 33 board\nP1 won by"}︡{"stdout":" 6 in 43 rounds with 36 tiles left in bag on a 19 by 21 board\nP1 won by"}︡{"stdout":" 5 in 25 rounds with 49 tiles left in bag on a 11 by 17 board\nP2 won by"}︡{"stdout":" 1 in 60 rounds with 29 tiles left in bag on a 26 by 18 board\nP1 won by"}︡{"stdout":" 2 in 69 rounds with 16 tiles left in bag on a 21 by 26 board\nP2 won by"}︡{"stdout":" 1 in 92 rounds with 19 tiles left in bag on a 15 by 30 board\nP2 won by"}︡{"stdout":" 4 in 16 rounds with 55 tiles left in bag on a 12 by 13 board\nP1 won by"}︡{"stdout":" 2 in 43 rounds with 41 tiles left in bag on a 20 by 18 board\nP2 won by"}︡{"stdout":" 2 in 58 rounds with 32 tiles left in bag on a 15 by 24 board\nP2 won by"}︡{"stdout":" 4 in 20 rounds with 53 tiles left in bag on a 13 by 16 board\nP2 won by"}︡{"stdout":" 1 in 26 rounds with 50 tiles left in bag on a 13 by 17 board\nP1 won by"}︡{"stdout":" 4 in 61 rounds with 28 tiles left in bag on a 39 by 17 board\nP1 won by"}︡{"stdout":" 7 in 23 rounds with 50 tiles left in bag on a 14 by 12 board\nP2 won by"}︡{"stdout":" 3 in 40 rounds with 39 tiles left in bag on a 18 by 19 board\nP2 won by"}︡{"stdout":" 2 in 48 rounds with 34 tiles left in bag on a 24 by 19 board\nP2 won by"}︡{"stdout":" 3 in 80 rounds with 13 tiles left in bag on a 25 by 21 board\nP2 won by"}︡{"stdout":" 3 in 30 rounds with 47 tiles left in bag on a 15 by 16 board\nP1 won by"}︡{"stdout":" 1 in 81 rounds with 10 tiles left in bag on a 30 by 29 board\nP2 won by"}︡{"stdout":" 3 in 44 rounds with 38 tiles left in bag on a 19 by 24 board\nP2 won by"}︡{"stdout":" 2 in 80 rounds with 13 tiles left in bag on a 23 by 26 board\nP2 won by"}︡{"stdout":" 2 in 18 rounds with 54 tiles left in bag on a 16 by 12 board\nP1 won by"}︡{"stdout":" 2 in 39 rounds with 42 tiles left in bag on a 24 by 22 board\nP2 won by"}︡{"stdout":" 2 in 94 rounds with 7 tiles left in bag on a 46 by 19 board\ndraw"}︡{"stdout":"\nP1 won by"}︡{"stdout":" 4 in 19 rounds with 54 tiles left in bag on a 18 by 13 board\nP2 won by"}︡{"stdout":" 2 in 78 rounds with 21 tiles left in bag on a 26 by 21 board\nP2 won by"}︡{"stdout":" 2 in 48 rounds with 36 tiles left in bag on a 22 by 19 board\nP1 won by"}︡{"stdout":" 2 in 23 rounds with 52 tiles left in bag on a 18 by 12 board\nP1 won by"}︡{"stdout":" 1 in 87 rounds with 12 tiles left in bag on a 26 by 25 board\nP1 won by"}︡{"stdout":" 1 in 15 rounds with 58 tiles left in bag on a 18 by 15 board\nP1 won by"}︡{"stdout":" 1 in 87 rounds with 11 tiles left in bag on a 29 by 24 board\nP1 won by"}︡{"stdout":" 2 in 21 rounds with 53 tiles left in bag on a 14 by 14 board\nP2 won by"}︡{"stdout":" 4 in 44 rounds with 40 tiles left in bag on a 14 by 23 board\nP2 won by"}︡{"stdout":" 4 in 36 rounds with 42 tiles left in bag on a 17 by 17 board\nP1 won by"}︡{"stdout":" 4 in 25 rounds with 51 tiles left in bag on a 14 by 15 board\nP2 won by"}︡{"stdout":" 8 in 16 rounds with 53 tiles left in bag on a 11 by 11 board\nP2 won by"}︡{"stdout":" 1 in 46 rounds with 39 tiles left in bag on a 18 by 26 board\nP2 won by"}︡{"stdout":" 1 in 64 rounds with 27 tiles left in bag on a 21 by 22 board\nP1 won by"}︡{"stdout":" 2 in 31 rounds with 45 tiles left in bag on a 17 by 15 board\nP2 won by"}︡{"stdout":" 1 in 28 rounds with 45 tiles left in bag on a 16 by 18 board\nP1 won by"}︡{"stdout":" 1 in 77 rounds with 18 tiles left in bag on a 29 by 16 board\nP1 won by"}︡{"stdout":" 3 in 19 rounds with 54 tiles left in bag on a 14 by 12 board\nP2 won by"}︡{"stdout":" 4 in 96 rounds with 8 tiles left in bag on a 20 by 33 board\nP1 won by"}︡{"stdout":" 4 in 89 rounds with 8 tiles left in bag on a 37 by 19 board\nP1 won by"}︡{"stdout":" 6 in 41 rounds with 37 tiles left in bag on a 16 by 20 board\nP1 won by"}︡{"stdout":" 4 in 47 rounds with 35 tiles left in bag on a 17 by 18 board\nP2 won by"}︡{"stdout":" 2 in 30 rounds with 48 tiles left in bag on a 14 by 17 board\nP1 won by"}︡{"stdout":" 3 in 67 rounds with 26 tiles left in bag on a 20 by 21 board\nP2 won by"}︡{"stdout":" 3 in 76 rounds with 19 tiles left in bag on a 21 by 27 board\nP2 won by"}︡{"stdout":" 4 in 16 rounds with 56 tiles left in bag on a 11 by 13 board\nP2 won by"}︡{"stdout":" 2 in 82 rounds with 13 tiles left in bag on a 20 by 25 board\nP1 won by"}︡{"stdout":" 4 in 61 rounds with 29 tiles left in bag on a 18 by 26 board\nP2 won by"}︡{"stdout":" 5 in 28 rounds with 48 tiles left in bag on a 17 by 15 board\nP1 won by"}︡{"stdout":" 1 in 79 rounds with 19 tiles left in bag on a 22 by 28 board\nP1 won by"}︡{"stdout":" 2 in 35 rounds with 44 tiles left in bag on a 14 by 18 board\nP2 won by"}︡{"stdout":" 2 in 74 rounds with 20 tiles left in bag on a 21 by 21 board\nP1 won by"}︡{"stdout":" 3 in 41 rounds with 41 tiles left in bag on a 16 by 22 board\nP1 won by 3 in 15 rounds with 57 tiles left in bag on a 14 by 11 board\nP2 won by"}︡{"stdout":" 5 in 18 rounds with 53 tiles left in bag on a 16 by 12 board\nP2 won by"}︡{"stdout":" 3 in 40 rounds with 39 tiles left in bag on a 20 by 15 board\nP1 won by"}︡{"stdout":" 3 in 25 rounds with 49 tiles left in bag on a 15 by 14 board\nP1 won by"}︡{"stdout":" 3 in 67 rounds with 22 tiles left in bag on a 20 by 25 board\nP2 won by"}︡{"stdout":" 2 in 64 rounds with 22 tiles left in bag on a 16 by 29 board\nP2 won by"}︡{"stdout":" 1 in 28 rounds with 48 tiles left in bag on a 16 by 21 board\nP2 won by"}︡{"stdout":" 4 in 44 rounds with 38 tiles left in bag on a 19 by 17 board\nP1 won by"}︡{"stdout":" 2 in 29 rounds with 48 tiles left in bag on a 14 by 19 board\nP2 won by"}︡{"stdout":" 2 in 20 rounds with 54 tiles left in bag on a 19 by 12 board\nP1 won by"}︡{"stdout":" 1 in 21 rounds with 53 tiles left in bag on a 15 by 14 board\nP2 won by"}︡{"stdout":" 2 in 56 rounds with 32 tiles left in bag on a 22 by 16 board\nP2 won by 1 in 16 rounds with 57 tiles left in bag on a 13 by 12 board\nP2 won by"}︡{"stdout":" 4 in 64 rounds with 25 tiles left in bag on a 16 by 24 board\nP2 won by"}︡{"stdout":" 2 in 54 rounds with 30 tiles left in bag on a 18 by 18 board\nP1 won by"}︡{"stdout":" 2 in 25 rounds with 51 tiles left in bag on a 10 by 18 board\nP2 won by"}︡{"stdout":" 1 in 20 rounds with 55 tiles left in bag on a 13 by 13 board\nP2 won by"}︡{"stdout":" 1 in 16 rounds with 57 tiles left in bag on a 16 by 13 board\nP2 won by"}︡{"stdout":" 4 in 18 rounds with 54 tiles left in bag on a 15 by 10 board\nP2 won by"}︡{"stdout":" 2 in 28 rounds with 48 tiles left in bag on a 13 by 18 board\nP1 won by"}︡{"stdout":" 2 in 69 rounds with 21 tiles left in bag on a 18 by 27 board\nP2 won by"}︡{"stdout":" 1 in 26 rounds with 48 tiles left in bag on a 12 by 19 board\nP1 won by"}︡{"stdout":" 2 in 37 rounds with 42 tiles left in bag on a 19 by 16 board\nP1 won by"}︡{"stdout":" 2 in 15 rounds with 57 tiles left in bag on a 12 by 11 board\nP1 won by"}︡{"stdout":" 4 in 57 rounds with 27 tiles left in bag on a 25 by 20 board\nP1 won by"}︡{"stdout":" 1 in 47 rounds with 40 tiles left in bag on a 21 by 15 board\nP2 won by"}︡{"stdout":" 1 in 64 rounds with 28 tiles left in bag on a 19 by 23 board\nP2 won by"}︡{"stdout":" 4 in 46 rounds with 36 tiles left in bag on a 17 by 22 board\nP2 won by"}︡{"stdout":" 4 in 86 rounds with 12 tiles left in bag on a 27 by 21 board\nP2 won by"}︡{"stdout":" 2 in 44 rounds with 39 tiles left in bag on a 23 by 16 board\ndraw;\n"}︡{"stdout":"\nP2 won by"}︡{"stdout":" 2 in 30 rounds with 47 tiles left in bag on a 21 by 15 board\nP2 won by"}︡{"stdout":" 5 in 58 rounds with 30 tiles left in bag on a 18 by 18 board\nP1 won by"}︡{"stdout":" 2 in 55 rounds with 31 tiles left in bag on a 21 by 18 board\nP2 won by"}︡{"stdout":" 2 in 84 rounds with 15 tiles left in bag on a 32 by 16 board\nP2 won by"}︡{"stdout":" 1 in 38 rounds with 42 tiles left in bag on a 19 by 20 board\nP1 won by"}︡{"stdout":" 4 in 31 rounds with 47 tiles left in bag on a 13 by 23 board\nP1 won by"}︡{"stdout":" 1 in 85 rounds with 9 tiles left in bag on a 31 by 24 board\nP1 won by"}︡{"stdout":" 1 in 17 rounds with 56 tiles left in bag on a 14 by 16 board\nP2 won by"}︡{"stdout":" 2 in 20 rounds with 55 tiles left in bag on a 12 by 14 board\nP2 won by"}︡{"stdout":" 2 in 62 rounds with 25 tiles left in bag on a 21 by 19 board\nP2 won by"}︡{"stdout":" 2 in 40 rounds with 41 tiles left in bag on a 20 by 19 board\nP1 won by"}︡{"stdout":" 1 in 49 rounds with 36 tiles left in bag on a 24 by 20 board\nP1 won by"}︡{"stdout":" 1 in 31 rounds with 47 tiles left in bag on a 14 by 20 board\nP2 won by"}︡{"stdout":" 3 in 46 rounds with 35 tiles left in bag on a 19 by 19 board\nP2 won by"}︡{"stdout":" 2 in 40 rounds with 42 tiles left in bag on a 17 by 16 board\nP2 won by"}︡{"stdout":" 2 in 74 rounds with 19 tiles left in bag on a 23 by 24 board\nP1 won by"}︡{"stdout":" 3 in 59 rounds with 30 tiles left in bag on a 24 by 23 board\nP1 won by"}︡{"stdout":" 2 in 95 rounds with 9 tiles left in bag on a 44 by 22 board\nP2 won by"}︡{"stdout":" 2 in 84 rounds with 8 tiles left in bag on a 25 by 24 board\nP2 won by"}︡{"stdout":" 3 in 38 rounds with 40 tiles left in bag on a 17 by 18 board\nP1 won by"}︡{"stdout":" 1 in 67 rounds with 23 tiles left in bag on a 23 by 21 board\nP1 won by"}︡{"stdout":" 2 in 75 rounds with 21 tiles left in bag on a 34 by 15 board\nP2 won by"}︡{"stdout":" 3 in 64 rounds with 25 tiles left in bag on a 18 by 23 board\nP1 won by"}︡{"stdout":" 1 in 39 rounds with 42 tiles left in bag on a 19 by 19 board\nP1 won by"}︡{"stdout":" 1 in 61 rounds with 29 tiles left in bag on a 29 by 16 board\nP2 won by"}︡{"stdout":" 4 in 32 rounds with 47 tiles left in bag on a 16 by 14 board\nP1 won by"}︡{"stdout":" 2 in 51 rounds with 32 tiles left in bag on a 20 by 19 board\nP1 won by"}︡{"stdout":" 1 in 71 rounds with 21 tiles left in bag on a 27 by 22 board\nP2 won by"}︡{"stdout":" 2 in 74 rounds with 23 tiles left in bag on a 26 by 22 board\nP2 won by"}︡{"stdout":" 2 in 86 rounds with 2 tiles left in bag on a 21 by 32 board\nP1 won by"}︡{"stdout":" 1 in 41 rounds with 39 tiles left in bag on a 16 by 20 board\nP1 won by"}︡{"stdout":" 3 in 95 rounds with 6 tiles left in bag on a 26 by 22 board\nP1 won by"}︡{"stdout":" 1 in 49 rounds with 36 tiles left in bag on a 15 by 21 board\nP2 won by"}︡{"stdout":" 3 in 34 rounds with 45 tiles left in bag on a 16 by 20 board\nP1 won by"}︡{"stdout":" 1 in 59 rounds with 27 tiles left in bag on a 27 by 22 board\nP2 won by"}︡{"stdout":" 2 in 66 rounds with 21 tiles left in bag on a 22 by 28 board\nP1 won by"}︡{"stdout":" 2 in 55 rounds with 34 tiles left in bag on a 18 by 20 board\nP1 won by"}︡{"stdout":" 1 in 43 rounds with 37 tiles left in bag on a 19 by 21 board\nP1 won by"}︡{"stdout":" 4 in 17 rounds with 55 tiles left in bag on a 10 by 18 board\nP2 won by"}︡{"stdout":" 1 in 28 rounds with 48 tiles left in bag on a 14 by 17 board\nP2 won by"}︡{"stdout":" 2 in 26 rounds with 50 tiles left in bag on a 14 by 14 board\nP1 won by"}︡{"stdout":" 1 in 49 rounds with 37 tiles left in bag on a 20 by 17 board\nP1 won by"}︡{"stdout":" 1 in 43 rounds with 39 tiles left in bag on a 20 by 24 board\nP2 won by"}︡{"stdout":" 4 in 22 rounds with 52 tiles left in bag on a 11 by 15 board\nP2 won by"}︡{"stdout":" 3 in 66 rounds with 21 tiles left in bag on a 32 by 21 board\nP2 won by"}︡{"stdout":" 1 in 56 rounds with 32 tiles left in bag on a 28 by 18 board\nP1 won by"}︡{"stdout":" 2 in 55 rounds with 30 tiles left in bag on a 22 by 17 board\nP1 won by"}︡{"stdout":" 1 in 57 rounds with 30 tiles left in bag on a 23 by 18 board\nP1 won by"}︡{"stdout":" 2 in 87 rounds with 12 tiles left in bag on a 28 by 22 board\nP2 won by"}︡{"stdout":" 2 in 30 rounds with 47 tiles left in bag on a 14 by 17 board\nP1 won by"}︡{"stdout":" 1 in 33 rounds with 43 tiles left in bag on a 16 by 18 board\nP1 won by"}︡{"stdout":" 1 in 59 rounds with 31 tiles left in bag on a 25 by 21 board\nP1 won by"}︡{"stdout":" 1 in 79 rounds with 15 tiles left in bag on a 27 by 24 board\nP1 won by"}︡{"stdout":" 2 in 21 rounds with 53 tiles left in bag on a 15 by 19 board\nP2 won by"}︡{"stdout":" 3 in 42 rounds with 41 tiles left in bag on a 23 by 15 board\nP1 won by"}︡{"stdout":" 3 in 43 rounds with 39 tiles left in bag on a 20 by 15 board\nP1 won by"}︡{"stdout":" 1 in 71 rounds with 21 tiles left in bag on a 25 by 24 board\nP2 won by"}︡{"stdout":" 1 in 40 rounds with 39 tiles left in bag on a 26 by 19 board\nP1 won by"}︡{"stdout":" 5 in 15 rounds with 56 tiles left in bag on a 12 by 15 board\nP2 won by"}︡{"stdout":" 5 in 22 rounds with 50 tiles left in bag on a 13 by 17 board\nP1 won by 1 in 15 rounds with 58 tiles left in bag on a 14 by 13 board\nP2 won by"}︡{"stdout":" 2 in 38 rounds with 42 tiles left in bag on a 17 by 17 board\nP2 won by"}︡{"stdout":" 1 in 24 rounds with 50 tiles left in bag on a 12 by 21 board\nP2 won by"}︡{"stdout":" 3 in 30 rounds with 48 tiles left in bag on a 18 by 14 board\nP1 won by"}︡{"stdout":" 4 in 47 rounds with 32 tiles left in bag on a 21 by 18 board\nP1 won by"}︡{"stdout":" 3 in 47 rounds with 35 tiles left in bag on a 28 by 15 board\nP2 won by"}︡{"stdout":" 2 in 26 rounds with 49 tiles left in bag on a 13 by 19 board\nP1 won by"}︡{"stdout":" 2 in 25 rounds with 51 tiles left in bag on a 17 by 14 board\nP2 won by"}︡{"stdout":" 2 in 24 rounds with 51 tiles left in bag on a 13 by 16 board\nP2 won by"}︡{"stdout":" 1 in 94 rounds with 5 tiles left in bag on a 23 by 31 board\nP2 won by"}︡{"stdout":" 1 in 20 rounds with 54 tiles left in bag on a 14 by 15 board\nP1 won by"}︡{"stdout":" 4 in 19 rounds with 54 tiles left in bag on a 12 by 15 board\nP2 won by"}︡{"stdout":" 2 in 76 rounds with 16 tiles left in bag on a 21 by 25 board\nP1 won by"}︡{"stdout":" 3 in 49 rounds with 34 tiles left in bag on a 15 by 22 board\nP2 won by"}︡{"stdout":" 2 in 62 rounds with 27 tiles left in bag on a 21 by 21 board\nP1 won by"}︡{"stdout":" 6 in 25 rounds with 48 tiles left in bag on a 14 by 20 board\nP1 won by"}︡{"stdout":" 2 in 57 rounds with 32 tiles left in bag on a 19 by 22 board\nP2 won by"}︡{"stdout":" 1 in 50 rounds with 31 tiles left in bag on a 16 by 26 board\nP1 won by"}︡{"stdout":" 2 in 29 rounds with 49 tiles left in bag on a 19 by 11 board\nP1 won by"}︡{"stdout":" 2 in 27 rounds with 47 tiles left in bag on a 11 by 20 board\nP2 won by"}︡{"stdout":" 1 in 62 rounds with 30 tiles left in bag on a 21 by 19 board\nP2 won by"}︡{"stdout":" 2 in 52 rounds with 33 tiles left in bag on a 22 by 18 board\nP1 won by"}︡{"stdout":" 4 in 77 rounds with 14 tiles left in bag on a 23 by 22 board\nP1 won by"}︡{"stdout":" 1 in 89 rounds with 10 tiles left in bag on a 29 by 20 board\nP1 won by"}︡{"stdout":" 3 in 55 rounds with 32 tiles left in bag on a 15 by 25 board\nP2 won by"}︡{"stdout":" 3 in 30 rounds with 46 tiles left in bag on a 16 by 18 board\nP1 won by"}︡{"stdout":" 2 in 89 rounds with 12 tiles left in bag on a 30 by 19 board\nP2 won by"}︡{"stdout":" 2 in 16 rounds with 57 tiles left in bag on a 10 by 15 board\nP1 won by"}︡{"stdout":" 3 in 65 rounds with 20 tiles left in bag on a 21 by 19 board\nP1 won by"}︡{"stdout":" 1 in 79 rounds with 14 tiles left in bag on a 24 by 33 board\nP2 won by"}︡{"stdout":" 1 in 32 rounds with 47 tiles left in bag on a 20 by 18 board\nP1 won by"}︡{"stdout":" 5 in 31 rounds with 46 tiles left in bag on a 15 by 15 board\nP1 won by"}︡{"stdout":" 2 in 27 rounds with 50 tiles left in bag on a 20 by 11 board\nP2 won by"}︡{"stdout":" 1 in 26 rounds with 51 tiles left in bag on a 11 by 14 board\nP2 won by"}︡{"stdout":" 1 in 56 rounds with 33 tiles left in bag on a 23 by 23 board\nP2 won by"}︡{"stdout":" 2 in 90 rounds with 14 tiles left in bag on a 36 by 26 board\nP2 won by"}︡{"stdout":" 1 in 20 rounds with 55 tiles left in bag on a 16 by 13 board\nP1 won by"}︡{"stdout":" 3 in 41 rounds with 43 tiles left in bag on a 21 by 18 board\nP2 won by"}︡{"stdout":" 4 in 54 rounds with 31 tiles left in bag on a 23 by 20 board\nP1 won by"}︡{"stdout":" 3 in 25 rounds with 51 tiles left in bag on a 13 by 15 board\nP2 won by"}︡{"stdout":" 2 in 62 rounds with 25 tiles left in bag on a 26 by 28 board\nP1 won by"}︡{"stdout":" 4 in 57 rounds with 28 tiles left in bag on a 20 by 18 board\nP1 won by"}︡{"stdout":" 4 in 19 rounds with 54 tiles left in bag on a 15 by 11 board\nP1 won by"}︡{"stdout":" 5 in 19 rounds with 53 tiles left in bag on a 11 by 16 board\nP2 won by"}︡{"stdout":" 2 in 36 rounds with 44 tiles left in bag on a 15 by 18 board\nP2 won by"}︡{"stdout":" 1 in 70 rounds with 21 tiles left in bag on a 24 by 24 board\nP1 won by"}︡{"stdout":" 3 in 59 rounds with 26 tiles left in bag on a 22 by 21 board\nP2 won by"}︡{"stdout":" 3 in 56 rounds with 34 tiles left in bag on a 21 by 15 board\nP1 won by"}︡{"stdout":" 3 in 45 rounds with 39 tiles left in bag on a 22 by 15 board\nP2 won by"}︡{"stdout":" 2 in 16 rounds with 57 tiles left in bag on a 12 by 16 board\nP2 won by"}︡{"stdout":" 2 in 16 rounds with 56 tiles left in bag on a 14 by 13 board\nP2 won by"}︡{"stdout":" 1 in 58 rounds with 29 tiles left in bag on a 33 by 16 board\nP2 won by"}︡{"stdout":" 1 in 32 rounds with 47 tiles left in bag on a 17 by 16 board\nP1 won by"}︡{"stdout":" 1 in 57 rounds with 28 tiles left in bag on a 17 by 22 board\nP2 won by"}︡{"stdout":" 4 in 22 rounds with 52 tiles left in bag on a 15 by 12 board\nP2 won by"}︡{"stdout":" 3 in 38 rounds with 42 tiles left in bag on a 21 by 17 board\nP2 won by"}︡{"stdout":" 2 in 56 rounds with 29 tiles left in bag on a 26 by 17 board\nP2 won by"}︡{"stdout":" 1 in 58 rounds with 28 tiles left in bag on a 24 by 23 board\nP1 won by"}︡{"stdout":" 3 in 39 rounds with 43 tiles left in bag on a 15 by 16 board\nP2 won by"}︡{"stdout":" 2 in 86 rounds with 12 tiles left in bag on a 23 by 23 board\nP1 won by"}︡{"stdout":" 5 in 65 rounds with 24 tiles left in bag on a 24 by 22 board\nP2 won by"}︡{"stdout":" 2 in 48 rounds with 39 tiles left in bag on a 17 by 17 board\nP1 won by"}︡{"stdout":" 1 in 43 rounds with 40 tiles left in bag on a 17 by 18 board\nP2 won by"}︡{"stdout":" 3 in 72 rounds with 17 tiles left in bag on a 24 by 23 board\nP2 won by"}︡{"stdout":" 1 in 102 rounds with 1 tiles left in bag on a 31 by 30 board\nP1 won by"}︡{"stdout":" 1 in 19 rounds with 56 tiles left in bag on a 15 by 14 board\nP2 won by"}︡{"stdout":" 3 in 50 rounds with 34 tiles left in bag on a 18 by 19 board\nP2 won by"}︡{"stdout":" 2 in 44 rounds with 40 tiles left in bag on a 21 by 17 board\nP1 won by"}︡{"stdout":" 4 in 25 rounds with 49 tiles left in bag on a 15 by 15 board\nP2 won by"}︡{"stdout":" 4 in 60 rounds with 33 tiles left in bag on a 21 by 17 board\nP2 won by"}︡{"stdout":" 2 in 16 rounds with 57 tiles left in bag on a 12 by 13 board\nP1 won by"}︡{"stdout":" 2 in 81 rounds with 17 tiles left in bag on a 29 by 29 board\ndraw"}︡{"stdout":"\nP2 won by"}︡{"stdout":" 1 in 38 rounds with 43 tiles left in bag on a 15 by 19 board\nP1 won by"}︡{"stdout":" 4 in 53 rounds with 30 tiles left in bag on a 20 by 23 board\nP1 won by"}︡{"stdout":" 2 in 59 rounds with 30 tiles left in bag on a 33 by 24 board\nP1 won by"}︡{"stdout":" 1 in 31 rounds with 48 tiles left in bag on a 25 by 12 board\nP1 won by"}︡{"stdout":" 3 in 67 rounds with 19 tiles left in bag on a 21 by 21 board\nP1 won by"}︡{"stdout":" 1 in 81 rounds with 16 tiles left in bag on a 26 by 32 board\nP2 won by"}︡{"stdout":" 3 in 68 rounds with 21 tiles left in bag on a 24 by 21 board\nP2 won by"}︡{"stdout":" 1 in 84 rounds with 17 tiles left in bag on a 20 by 29 board\nP2 won by"}︡{"stdout":" 2 in 54 rounds with 28 tiles left in bag on a 25 by 22 board\nP2 won by"}︡{"stdout":" 2 in 94 rounds with 5 tiles left in bag on a 31 by 21 board\nP2 won by"}︡{"stdout":" 2 in 42 rounds with 42 tiles left in bag on a 18 by 17 board\nP2 won by"}︡{"stdout":" 3 in 80 rounds with 15 tiles left in bag on a 22 by 28 board\nP1 won by"}︡{"stdout":" 3 in 59 rounds with 27 tiles left in bag on a 21 by 20 board\nP2 won by"}︡{"stdout":" 8 in 18 rounds with 52 tiles left in bag on a 13 by 17 board\nP1 won by"}︡{"stdout":" 1 in 59 rounds with 33 tiles left in bag on a 28 by 13 board\nP2 won by"}︡{"stdout":" 3 in 64 rounds with 24 tiles left in bag on a 26 by 30 board\nP2 won by"}︡{"stdout":" 5 in 40 rounds with 40 tiles left in bag on a 20 by 15 board\nP1 won by"}︡{"stdout":" 4 in 19 rounds with 53 tiles left in bag on a 13 by 15 board\nP2 won by"}︡{"stdout":" 2 in 62 rounds with 25 tiles left in bag on a 25 by 22 board\nP2 won by"}︡{"stdout":" 4 in 18 rounds with 54 tiles left in bag on a 18 by 9 board\nP2 won by"}︡{"stdout":" 3 in 18 rounds with 55 tiles left in bag on a 11 by 13 board\nP1 won by"}︡{"stdout":" 1 in 71 rounds with 22 tiles left in bag on a 26 by 18 board\nP1 won by"}︡{"stdout":" 4 in 45 rounds with 37 tiles left in bag on a 22 by 14 board\nP1 won by"}︡{"stdout":" 4 in 21 rounds with 52 tiles left in bag on a 16 by 12 board\nP2 won by"}︡{"stdout":" 4 in 48 rounds with 36 tiles left in bag on a 17 by 18 board\nP1 won by"}︡{"stdout":" 4 in 37 rounds with 40 tiles left in bag on a 16 by 16 board\nP2 won by"}︡{"stdout":" 2 in 34 rounds with 45 tiles left in bag on a 20 by 20 board\nP1 won by"}︡{"stdout":" 3 in 31 rounds with 46 tiles left in bag on a 15 by 15 board\nP1 won by"}︡{"stdout":" 1 in 73 rounds with 26 tiles left in bag on a 22 by 22 board\nP1 won by"}︡{"stdout":" 2 in 87 rounds with 9 tiles left in bag on a 26 by 23 board\nP1 won by"}︡{"stdout":" 2 in 85 rounds with 12 tiles left in bag on a 28 by 27 board\nP2 won by"}︡{"stdout":" 2 in 80 rounds with 19 tiles left in bag on a 33 by 25 board\nP2 won by"}︡{"stdout":" 1 in 52 rounds with 36 tiles left in bag on a 20 by 18 board\nP1 won by"}︡{"stdout":" 1 in 59 rounds with 29 tiles left in bag on a 20 by 21 board\nP2 won by"}︡{"stdout":" 1 in 86 rounds with 10 tiles left in bag on a 29 by 25 board\nP1 won by"}︡{"stdout":" 2 in 85 rounds with 11 tiles left in bag on a 26 by 27 board\nP2 won by"}︡{"stdout":" 1 in 60 rounds with 28 tiles left in bag on a 26 by 26 board\nP1 won by"}︡{"stdout":" 1 in 85 rounds with 8 tiles left in bag on a 27 by 30 board\nP2 won by"}︡{"stdout":" 4 in 20 rounds with 53 tiles left in bag on a 14 by 11 board\nP2 won by"}︡{"stdout":" 1 in 46 rounds with 38 tiles left in bag on a 18 by 21 board\nP1 won by"}︡{"stdout":" 2 in 25 rounds with 50 tiles left in bag on a 15 by 18 board\nP2 won by"}︡{"stdout":" 2 in 34 rounds with 45 tiles left in bag on a 15 by 20 board\nP2 won by"}︡{"stdout":" 2 in 22 rounds with 53 tiles left in bag on a 17 by 15 board\nP1 won by"}︡{"stdout":" 1 in 65 rounds with 25 tiles left in bag on a 18 by 24 board\nP1 won by"}︡{"stdout":" 2 in 59 rounds with 28 tiles left in bag on a 24 by 20 board\nP2 won by"}︡{"stdout":" 1 in 74 rounds with 22 tiles left in bag on a 27 by 26 board\nP2 won by"}︡{"stdout":" 2 in 56 rounds with 29 tiles left in bag on a 17 by 29 board\nP2 won by"}︡{"stdout":" 1 in 90 rounds with 10 tiles left in bag on a 25 by 24 board\nP1 won by"}︡{"stdout":" 1 in 95 rounds with 11 tiles left in bag on a 26 by 27 board\nP2 won by"}︡{"stdout":" 3 in 46 rounds with 35 tiles left in bag on a 19 by 18 board\nP1 won by"}︡{"stdout":" 1 in 79 rounds with 20 tiles left in bag on a 23 by 24 board\nP2 won by"}︡{"stdout":" 3 in 24 rounds with 52 tiles left in bag on a 15 by 16 board\nP2 won by"}︡{"stdout":" 2 in 88 rounds with 10 tiles left in bag on a 22 by 36 board\nP1 won by"}︡{"stdout":" 2 in 53 rounds with 33 tiles left in bag on a 24 by 15 board\nP1 won by"}︡{"stdout":" 1 in 61 rounds with 27 tiles left in bag on a 22 by 22 board\nP1 won by"}︡{"stdout":" 1 in 29 rounds with 46 tiles left in bag on a 13 by 18 board\nP2 won by"}︡{"stdout":" 2 in 58 rounds with 32 tiles left in bag on a 24 by 20 board\nP2 won by"}︡{"stdout":" 3 in 30 rounds with 44 tiles left in bag on a 18 by 16 board\nP2 won by"}︡{"stdout":" 3 in 48 rounds with 34 tiles left in bag on a 19 by 15 board\ndraw"}︡{"stdout":"\nP2 won by"}︡{"stdout":" 3 in 94 rounds with 2 tiles left in bag on a 26 by 28 board\nP1 won by"}︡{"stdout":" 5 in 31 rounds with 47 tiles left in bag on a 18 by 13 board\nP1 won by"}︡{"stdout":" 2 in 25 rounds with 50 tiles left in bag on a 13 by 23 board\nP2 won by"}︡{"stdout":" 1 in 86 rounds with 10 tiles left in bag on a 26 by 28 board\nP1 won by"}︡{"stdout":" 4 in 25 rounds with 49 tiles left in bag on a 16 by 15 board\nP2 won by"}︡{"stdout":" 5 in 62 rounds with 25 tiles left in bag on a 21 by 19 board\nP1 won by"}︡{"stdout":" 1 in 53 rounds with 35 tiles left in bag on a 26 by 21 board\nP2 won by"}︡{"stdout":" 1 in 32 rounds with 44 tiles left in bag on a 22 by 14 board\nP2 won by"}︡{"stdout":" 4 in 32 rounds with 45 tiles left in bag on a 14 by 18 board\nP2 won by 2 in 16 rounds with 57 tiles left in bag on a 16 by 10 board\nP2 won by"}︡{"stdout":" 3 in 60 rounds with 31 tiles left in bag on a 23 by 17 board\ndraw;\n"}︡{"stdout":"\nP2 won by"}︡{"stdout":" 2 in 78 rounds with 17 tiles left in bag on a 27 by 18 board\nP1 won by"}︡{"stdout":" 1 in 47 rounds with 32 tiles left in bag on a 21 by 22 board\nP1 won by"}︡{"stdout":" 1 in 81 rounds with 13 tiles left in bag on a 31 by 23 board\nP1 won by"}︡{"stdout":" 3 in 25 rounds with 51 tiles left in bag on a 14 by 17 board\nP2 won by"}︡{"stdout":" 1 in 44 rounds with 37 tiles left in bag on a 23 by 17 board\nP1 won by"}︡{"stdout":" 1 in 25 rounds with 51 tiles left in bag on a 16 by 14 board\nP2 won by"}︡{"stdout":" 2 in 42 rounds with 41 tiles left in bag on a 20 by 18 board\nP1 won by"}︡{"stdout":" 1 in 75 rounds with 14 tiles left in bag on a 22 by 28 board\nP2 won by"}︡{"stdout":" 2 in 24 rounds with 50 tiles left in bag on a 14 by 15 board\nP2 won by"}︡{"stdout":" 2 in 20 rounds with 53 tiles left in bag on a 13 by 16 board\nP1 won by"}︡{"stdout":" 2 in 41 rounds with 40 tiles left in bag on a 17 by 18 board\nP2 won by"}︡{"stdout":" 1 in 34 rounds with 46 tiles left in bag on a 18 by 20 board\nP1 won by"}︡{"stdout":" 4 in 21 rounds with 52 tiles left in bag on a 15 by 13 board\nP1 won by"}︡{"stdout":" 5 in 15 rounds with 56 tiles left in bag on a 10 by 13 board\nP2 won by"}︡{"stdout":" 2 in 76 rounds with 17 tiles left in bag on a 29 by 23 board\ndraw;\n"}︡{"stdout":"\nP2 won by"}︡{"stdout":" 1 in 70 rounds with 20 tiles left in bag on a 24 by 22 board\nP1 won by"}︡{"stdout":" 1 in 71 rounds with 19 tiles left in bag on a 21 by 27 board\nP2 won by"}︡{"stdout":" 3 in 60 rounds with 25 tiles left in bag on a 23 by 18 board\nP1 won by"}︡{"stdout":" 2 in 27 rounds with 50 tiles left in bag on a 19 by 13 board\nP1 won by"}︡{"stdout":" 2 in 71 rounds with 26 tiles left in bag on a 30 by 25 board\nP1 won by"}︡{"stdout":" 3 in 55 rounds with 31 tiles left in bag on a 24 by 20 board\nP2 won by"}︡{"stdout":" 3 in 56 rounds with 30 tiles left in bag on a 17 by 21 board\nP2 won by"}︡{"stdout":" 5 in 18 rounds with 54 tiles left in bag on a 14 by 14 board\nP2 won by"}︡{"stdout":" 2 in 88 rounds with 3 tiles left in bag on a 32 by 25 board\nP1 won by"}︡{"stdout":" 5 in 15 rounds with 56 tiles left in bag on a 13 by 12 board\nP2 won by"}︡{"stdout":" 2 in 48 rounds with 37 tiles left in bag on a 20 by 17 board\nP2 won by"}︡{"stdout":" 2 in 34 rounds with 46 tiles left in bag on a 20 by 13 board\nP1 won by"}︡{"stdout":" 3 in 21 rounds with 53 tiles left in bag on a 15 by 21 board\nP1 won by"}︡{"stdout":" 6 in 43 rounds with 39 tiles left in bag on a 21 by 17 board\nP1 won by"}︡{"stdout":" 2 in 17 rounds with 56 tiles left in bag on a 18 by 11 board\nP2 won by"}︡{"stdout":" 5 in 22 rounds with 51 tiles left in bag on a 16 by 15 board\nP2 won by"}︡{"stdout":" 2 in 36 rounds with 43 tiles left in bag on a 16 by 16 board\nP1 won by"}︡{"stdout":" 6 in 39 rounds with 40 tiles left in bag on a 22 by 16 board\nP1 won by"}︡{"stdout":" 2 in 25 rounds with 50 tiles left in bag on a 15 by 15 board\nP1 won by"}︡{"stdout":" 2 in 79 rounds with 15 tiles left in bag on a 27 by 25 board\nP2 won by"}︡{"stdout":" 3 in 34 rounds with 44 tiles left in bag on a 17 by 20 board\nP2 won by"}︡{"stdout":" 6 in 16 rounds with 54 tiles left in bag on a 12 by 13 board\nP2 won by"}︡{"stdout":" 4 in 42 rounds with 38 tiles left in bag on a 24 by 19 board\nP1 won by"}︡{"stdout":" 6 in 17 rounds with 54 tiles left in bag on a 11 by 11 board\nP2 won by"}︡{"stdout":" 2 in 80 rounds with 15 tiles left in bag on a 28 by 29 board\nP2 won by"}︡{"stdout":" 3 in 48 rounds with 37 tiles left in bag on a 21 by 20 board\nP1 won by"}︡{"stdout":" 3 in 19 rounds with 55 tiles left in bag on a 9 by 19 board\nP1 won by"}︡{"stdout":" 3 in 43 rounds with 39 tiles left in bag on a 15 by 20 board\nP1 won by"}︡{"stdout":" 1 in 85 rounds with 11 tiles left in bag on a 25 by 26 board\nP2 won by"}︡{"stdout":" 2 in 22 rounds with 52 tiles left in bag on a 12 by 15 board\nP1 won by"}︡{"stdout":" 1 in 43 rounds with 40 tiles left in bag on a 26 by 12 board\nP1 won by"}︡{"stdout":" 3 in 63 rounds with 22 tiles left in bag on a 22 by 20 board\nP1 won by"}︡{"stdout":" 3 in 77 rounds with 18 tiles left in bag on a 17 by 24 board\nP2 won by"}︡{"stdout":" 2 in 92 rounds with 12 tiles left in bag on a 24 by 24 board\nP1 won by"}︡{"stdout":" 1 in 71 rounds with 25 tiles left in bag on a 17 by 29 board\nP2 won by"}︡{"stdout":" 4 in 34 rounds with 42 tiles left in bag on a 15 by 16 board\nP1 won by"}︡{"stdout":" 3 in 19 rounds with 54 tiles left in bag on a 15 by 13 board\nP2 won by"}︡{"stdout":" 4 in 32 rounds with 44 tiles left in bag on a 20 by 15 board\nP1 won by"}︡{"stdout":" 4 in 53 rounds with 32 tiles left in bag on a 23 by 16 board\nP2 won by 4 in 16 rounds with 56 tiles left in bag on a 13 by 13 board\nP2 won by"}︡{"stdout":" 3 in 70 rounds with 21 tiles left in bag on a 26 by 20 board\nP2 won by"}︡{"stdout":" 4 in 30 rounds with 46 tiles left in bag on a 16 by 15 board\nP2 won by 1 in 16 rounds with 57 tiles left in bag on a 13 by 14 board\nP1 won by"}︡{"stdout":" 2 in 23 rounds with 52 tiles left in bag on a 14 by 16 board\nP1 won by"}︡{"stdout":" 2 in 67 rounds with 21 tiles left in bag on a 22 by 25 board\nP1 won by"}︡{"stdout":" 2 in 81 rounds with 18 tiles left in bag on a 22 by 34 board\nP1 won by"}︡{"stdout":" 1 in 35 rounds with 44 tiles left in bag on a 18 by 15 board\nP1 won by"}︡{"stdout":" 1 in 25 rounds with 51 tiles left in bag on a 17 by 16 board\nP1 won by"}︡{"stdout":" 2 in 67 rounds with 24 tiles left in bag on a 26 by 20 board\nP2 won by"}︡{"stdout":" 3 in 16 rounds with 56 tiles left in bag on a 17 by 13 board\nP1 won by"}︡{"stdout":" 3 in 31 rounds with 47 tiles left in bag on a 16 by 15 board\nP1 won by"}︡{"stdout":" 4 in 23 rounds with 51 tiles left in bag on a 12 by 18 board\nP2 won by 2 in 18 rounds with 55 tiles left in bag on a 11 by 15 board\nP1 won by"}︡{"stdout":" 1 in 17 rounds with 56 tiles left in bag on a 18 by 11 board\nP2 won by"}︡{"stdout":" 2 in 86 rounds with 9 tiles left in bag on a 39 by 20 board\nP1 won by"}︡{"stdout":" 1 in 35 rounds with 46 tiles left in bag on a 13 by 20 board\nP1 won by"}︡{"stdout":" 1 in 65 rounds with 22 tiles left in bag on a 24 by 21 board\nP1 won by"}︡{"stdout":" 2 in 43 rounds with 37 tiles left in bag on a 20 by 18 board\nP2 won by"}︡{"stdout":" 4 in 54 rounds with 32 tiles left in bag on a 18 by 19 board\nP1 won by"}︡{"stdout":" 2 in 55 rounds with 28 tiles left in bag on a 25 by 16 board\nP1 won by"}︡{"stdout":" 1 in 65 rounds with 26 tiles left in bag on a 20 by 26 board\nP2 won by"}︡{"stdout":" 3 in 24 rounds with 51 tiles left in bag on a 14 by 14 board\nP1 won by"}︡{"stdout":" 1 in 79 rounds with 13 tiles left in bag on a 25 by 26 board\nP1 won by"}︡{"stdout":" 1 in 55 rounds with 36 tiles left in bag on a 17 by 22 board\nP1 won by"}︡{"stdout":" 1 in 95 rounds with 4 tiles left in bag on a 30 by 24 board\nP1 won by"}︡{"stdout":" 1 in 85 rounds with 8 tiles left in bag on a 33 by 26 board\nP2 won by"}︡{"stdout":" 1 in 74 rounds with 20 tiles left in bag on a 26 by 25 board\nP1 won by"}︡{"stdout":" 1 in 71 rounds with 22 tiles left in bag on a 23 by 23 board\nP2 won by"}︡{"stdout":" 2 in 52 rounds with 33 tiles left in bag on a 23 by 16 board\nP2 won by"}︡{"stdout":" 4 in 22 rounds with 51 tiles left in bag on a 14 by 12 board\nP1 won by"}︡{"stdout":" 4 in 57 rounds with 30 tiles left in bag on a 22 by 17 board\nP2 won by"}︡{"stdout":" 3 in 44 rounds with 37 tiles left in bag on a 17 by 17 board\nP2 won by"}︡{"stdout":" 3 in 66 rounds with 29 tiles left in bag on a 30 by 15 board\nP2 won by"}︡{"stdout":" 1 in 50 rounds with 35 tiles left in bag on a 21 by 26 board\nP2 won by"}︡{"stdout":" 1 in 52 rounds with 33 tiles left in bag on a 15 by 27 board\nP1 won by"}︡{"stdout":" 3 in 27 rounds with 48 tiles left in bag on a 17 by 18 board\nP1 won by"}︡{"stdout":" 1 in 17 rounds with 56 tiles left in bag on a 9 by 16 board\nP2 won by"}︡{"stdout":" 2 in 58 rounds with 30 tiles left in bag on a 22 by 22 board\nP1 won by"}︡{"stdout":" 4 in 69 rounds with 22 tiles left in bag on a 19 by 29 board\nP2 won by"}︡{"stdout":" 4 in 58 rounds with 26 tiles left in bag on a 25 by 22 board\nP1 won by"}︡{"stdout":" 1 in 17 rounds with 56 tiles left in bag on a 15 by 11 board\nP1 won by"}︡{"stdout":" 4 in 53 rounds with 30 tiles left in bag on a 20 by 18 board\nP2 won by"}︡{"stdout":" 2 in 80 rounds with 19 tiles left in bag on a 28 by 23 board\nP1 won by"}︡{"stdout":" 4 in 15 rounds with 56 tiles left in bag on a 13 by 11 board\nP2 won by"}︡{"stdout":" 2 in 28 rounds with 47 tiles left in bag on a 17 by 16 board\nP2 won by"}︡{"stdout":" 1 in 62 rounds with 24 tiles left in bag on a 21 by 22 board\nP2 won by"}︡{"stdout":" 1 in 90 rounds with 6 tiles left in bag on a 29 by 27 board\nP1 won by"}︡{"stdout":" 1 in 55 rounds with 34 tiles left in bag on a 19 by 21 board\nP2 won by"}︡{"stdout":" 2 in 42 rounds with 40 tiles left in bag on a 23 by 17 board\nP1 won by"}︡{"stdout":" 3 in 49 rounds with 33 tiles left in bag on a 20 by 17 board\nP2 won by"}︡{"stdout":" 1 in 44 rounds with 39 tiles left in bag on a 17 by 22 board\nP2 won by"}︡{"stdout":" 3 in 60 rounds with 26 tiles left in bag on a 22 by 19 board\nP2 won by"}︡{"stdout":" 4 in 62 rounds with 26 tiles left in bag on a 19 by 24 board\nP2 won by"}︡{"stdout":" 3 in 34 rounds with 43 tiles left in bag on a 19 by 14 board\nP2 won by"}︡{"stdout":" 1 in 36 rounds with 42 tiles left in bag on a 19 by 20 board\nP2 won by"}︡{"stdout":" 5 in 20 rounds with 52 tiles left in bag on a 10 by 16 board\nP1 won by"}︡{"stdout":" 2 in 97 rounds with 7 tiles left in bag on a 33 by 20 board\nP1 won by"}︡{"stdout":" 7 in 47 rounds with 34 tiles left in bag on a 16 by 20 board\nP2 won by"}︡{"stdout":" 3 in 36 rounds with 46 tiles left in bag on a 17 by 16 board\nP2 won by"}︡{"stdout":" 1 in 20 rounds with 54 tiles left in bag on a 16 by 15 board\nP1 won by"}︡{"stdout":" 1 in 39 rounds with 41 tiles left in bag on a 17 by 18 board\nP2 won by"}︡{"stdout":" 3 in 46 rounds with 39 tiles left in bag on a 21 by 15 board\nP1 won by"}︡{"stdout":" 1 in 77 rounds with 11 tiles left in bag on a 22 by 27 board\nP1 won by"}︡{"stdout":" 3 in 51 rounds with 33 tiles left in bag on a 19 by 19 board\nP2 won by"}︡{"stdout":" 4 in 32 rounds with 46 tiles left in bag on a 16 by 14 board\nP1 won by"}︡{"stdout":" 3 in 29 rounds with 48 tiles left in bag on a 18 by 15 board\nP1 won by"}︡{"stdout":" 6 in 17 rounds with 54 tiles left in bag on a 13 by 13 board\nP2 won by"}︡{"stdout":" 2 in 48 rounds with 39 tiles left in bag on a 19 by 16 board\nP2 won by"}︡{"stdout":" 2 in 78 rounds with 17 tiles left in bag on a 30 by 22 board\nP2 won by"}︡{"stdout":" 6 in 46 rounds with 35 tiles left in bag on a 19 by 20 board\nP2 won by"}︡{"stdout":" 3 in 90 rounds with 3 tiles left in bag on a 21 by 32 board\nP1 won by"}︡{"stdout":" 5 in 41 rounds with 40 tiles left in bag on a 16 by 22 board\nP2 won by"}︡{"stdout":" 1 in 32 rounds with 48 tiles left in bag on a 15 by 15 board\nP1 won by"}︡{"stdout":" 1 in 67 rounds with 26 tiles left in bag on a 28 by 27 board\nP2 won by"}︡{"stdout":" 2 in 30 rounds with 46 tiles left in bag on a 13 by 18 board\nP2 won by"}︡{"stdout":" 1 in 50 rounds with 35 tiles left in bag on a 22 by 18 board\nP2 won by"}︡{"stdout":" 2 in 28 rounds with 49 tiles left in bag on a 15 by 19 board\nP2 won by"}︡{"stdout":" 3 in 72 rounds with 22 tiles left in bag on a 32 by 20 board\nP2 won by"}︡{"stdout":" 3 in 24 rounds with 50 tiles left in bag on a 15 by 13 board\nP1 won by"}︡{"stdout":" 1 in 21 rounds with 53 tiles left in bag on a 14 by 17 board\nP1 won by"}︡{"stdout":" 1 in 65 rounds with 25 tiles left in bag on a 24 by 23 board\nP1 won by"}︡{"stdout":" 2 in 35 rounds with 44 tiles left in bag on a 17 by 19 board\nP2 won by"}︡{"stdout":" 2 in 36 rounds with 45 tiles left in bag on a 14 by 16 board\nP2 won by"}︡{"stdout":" 4 in 18 rounds with 54 tiles left in bag on a 16 by 13 board\nP1 won by"}︡{"stdout":" 3 in 29 rounds with 48 tiles left in bag on a 13 by 19 board\nP1 won by"}︡{"stdout":" 2 in 27 rounds with 50 tiles left in bag on a 19 by 17 board\nP2 won by"}︡{"stdout":" 2 in 38 rounds with 44 tiles left in bag on a 19 by 23 board\nP1 won by"}︡{"stdout":" 1 in 95 rounds with 5 tiles left in bag on a 29 by 22 board\nP2 won by"}︡{"stdout":" 4 in 22 rounds with 51 tiles left in bag on a 14 by 11 board\nP1 won by"}︡{"stdout":" 3 in 55 rounds with 31 tiles left in bag on a 25 by 21 board\ndraw;\n"}︡{"stdout":"\nP2 won by"}︡{"stdout":" 2 in 22 rounds with 53 tiles left in bag on a 13 by 18 board\nP1 won by"}︡{"stdout":" 3 in 45 rounds with 37 tiles left in bag on a 19 by 16 board\nP1 won by"}︡{"stdout":" 2 in 91 rounds with 11 tiles left in bag on a 25 by 29 board\nP1 won by"}︡{"stdout":" 1 in 59 rounds with 28 tiles left in bag on a 18 by 23 board\nP2 won by"}︡{"stdout":" 2 in 34 rounds with 46 tiles left in bag on a 18 by 16 board\nP1 won by"}︡{"stdout":" 3 in 83 rounds with 16 tiles left in bag on a 30 by 17 board\nP2 won by"}︡{"stdout":" 2 in 22 rounds with 52 tiles left in bag on a 16 by 13 board\nP1 won by"}︡{"stdout":" 1 in 83 rounds with 11 tiles left in bag on a 22 by 38 board\nP1 won by"}︡{"stdout":" 2 in 63 rounds with 21 tiles left in bag on a 17 by 23 board\nP1 won by"}︡{"stdout":" 1 in 55 rounds with 31 tiles left in bag on a 22 by 25 board\nP2 won by"}︡{"stdout":" 1 in 52 rounds with 32 tiles left in bag on a 27 by 16 board\nP1 won by"}︡{"stdout":" 3 in 73 rounds with 16 tiles left in bag on a 24 by 21 board\nP2 won by"}︡{"stdout":" 1 in 54 rounds with 33 tiles left in bag on a 22 by 20 board\nP1 won by"}︡{"stdout":" 1 in 51 rounds with 35 tiles left in bag on a 18 by 24 board\nP2 won by 1 in 16 rounds with 57 tiles left in bag on a 13 by 12 board\nP2 won by"}︡{"stdout":" 2 in 48 rounds with 40 tiles left in bag on a 17 by 22 board\nP2 won by"}︡{"stdout":" 3 in 30 rounds with 46 tiles left in bag on a 15 by 16 board\nP1 won by"}︡{"stdout":" 2 in 51 rounds with 36 tiles left in bag on a 26 by 18 board\nP1 won by"}︡{"stdout":" 2 in 29 rounds with 49 tiles left in bag on a 14 by 18 board\nP2 won by"}︡{"stdout":" 6 in 22 rounds with 51 tiles left in bag on a 15 by 12 board\nP2 won by"}︡{"stdout":" 5 in 32 rounds with 46 tiles left in bag on a 16 by 16 board\nP1 won by"}︡{"stdout":" 6 in 31 rounds with 46 tiles left in bag on a 16 by 18 board\nP2 won by"}︡{"stdout":" 5 in 52 rounds with 33 tiles left in bag on a 20 by 17 board\nP2 won by"}︡{"stdout":" 2 in 26 rounds with 51 tiles left in bag on a 13 by 13 board\nP1 won by"}︡{"stdout":" 3 in 45 rounds with 37 tiles left in bag on a 17 by 23 board\nP2 won by"}︡{"stdout":" 5 in 40 rounds with 40 tiles left in bag on a 21 by 14 board\nP2 won by"}︡{"stdout":" 4 in 56 rounds with 28 tiles left in bag on a 24 by 19 board\nP2 won by"}︡{"stdout":" 4 in 72 rounds with 24 tiles left in bag on a 16 by 34 board\nP1 won by"}︡{"stdout":" 2 in 17 rounds with 55 tiles left in bag on a 14 by 13 board\nP2 won by"}︡{"stdout":" 1 in 38 rounds with 42 tiles left in bag on a 15 by 19 board\nP1 won by"}︡{"stdout":" 1 in 47 rounds with 38 tiles left in bag on a 22 by 18 board\nP2 won by"}︡{"stdout":" 4 in 18 rounds with 54 tiles left in bag on a 10 by 16 board\nP2 won by"}︡{"stdout":" 1 in 54 rounds with 29 tiles left in bag on a 22 by 22 board\nP1 won by 3 in 15 rounds with 57 tiles left in bag on a 12 by 12 board\nP2 won by"}︡{"stdout":" 3 in 40 rounds with 40 tiles left in bag on a 13 by 22 board\nP1 won by"}︡{"stdout":" 2 in 45 rounds with 38 tiles left in bag on a 25 by 16 board\nP1 won by 3 in 15 rounds with 57 tiles left in bag on a 13 by 9 board\nP1 won by"}︡{"stdout":" 1 in 51 rounds with 35 tiles left in bag on a 18 by 25 board\nP1 won by"}︡{"stdout":" 1 in 35 rounds with 45 tiles left in bag on a 16 by 16 board\nP2 won by"}︡{"stdout":" 2 in 22 rounds with 52 tiles left in bag on a 14 by 17 board\nP1 won by"}︡{"stdout":" 4 in 15 rounds with 56 tiles left in bag on a 13 by 12 board\nP1 won by"}︡{"stdout":" 2 in 45 rounds with 34 tiles left in bag on a 18 by 24 board\nP1 won by"}︡{"stdout":" 5 in 33 rounds with 44 tiles left in bag on a 15 by 18 board\nP1 won by"}︡{"stdout":" 2 in 41 rounds with 38 tiles left in bag on a 16 by 20 board\nP1 won by"}︡{"stdout":" 1 in 29 rounds with 48 tiles left in bag on a 16 by 19 board\nP2 won by"}︡{"stdout":" 1 in 28 rounds with 49 tiles left in bag on a 18 by 14 board\nP1 won by"}︡{"stdout":" 5 in 39 rounds with 40 tiles left in bag on a 19 by 19 board\nP2 won by"}︡{"stdout":" 7 in 44 rounds with 38 tiles left in bag on a 15 by 21 board\nP1 won by"}︡{"stdout":" 1 in 41 rounds with 38 tiles left in bag on a 16 by 22 board\nP2 won by"}︡{"stdout":" 1 in 44 rounds with 40 tiles left in bag on a 24 by 18 board\nP2 won by"}︡{"stdout":" 1 in 74 rounds with 19 tiles left in bag on a 25 by 25 board\nP2 won by"}︡{"stdout":" 2 in 72 rounds with 19 tiles left in bag on a 25 by 18 board\nP1 won by"}︡{"stdout":" 3 in 19 rounds with 54 tiles left in bag on a 12 by 13 board\nP2 won by"}︡{"stdout":" 1 in 20 rounds with 54 tiles left in bag on a 17 by 13 board\nP2 won by"}︡{"stdout":" 1 in 64 rounds with 30 tiles left in bag on a 21 by 25 board\nP2 won by"}︡{"stdout":" 2 in 56 rounds with 33 tiles left in bag on a 27 by 16 board\nP2 won by"}︡{"stdout":" 3 in 52 rounds with 34 tiles left in bag on a 17 by 21 board\nP2 won by"}︡{"stdout":" 1 in 40 rounds with 42 tiles left in bag on a 19 by 18 board\nP2 won by"}︡{"stdout":" 1 in 60 rounds with 28 tiles left in bag on a 26 by 23 board\nP1 won by"}︡{"stdout":" 2 in 47 rounds with 35 tiles left in bag on a 18 by 20 board\nP2 won by"}︡{"stdout":" 3 in 52 rounds with 36 tiles left in bag on a 19 by 17 board\nP1 won by"}︡{"stdout":" 1 in 51 rounds with 31 tiles left in bag on a 25 by 23 board\nP1 won by"}︡{"stdout":" 4 in 47 rounds with 34 tiles left in bag on a 16 by 22 board\nP2 won by"}︡{"stdout":" 4 in 50 rounds with 34 tiles left in bag on a 19 by 17 board\nP1 won by"}︡{"stdout":" 2 in 85 rounds with 8 tiles left in bag on a 20 by 29 board\nP2 won by"}︡{"stdout":" 2 in 20 rounds with 54 tiles left in bag on a 13 by 17 board\nP1 won by"}︡{"stdout":" 1 in 75 rounds with 16 tiles left in bag on a 29 by 20 board\nP2 won by"}︡{"stdout":" 1 in 30 rounds with 48 tiles left in bag on a 17 by 16 board\nP1 won by"}︡{"stdout":" 2 in 95 rounds with 2 tiles left in bag on a 29 by 23 board\nP2 won by"}︡{"stdout":" 4 in 42 rounds with 38 tiles left in bag on a 21 by 16 board\nP2 won by"}︡{"stdout":" 1 in 58 rounds with 24 tiles left in bag on a 20 by 24 board\nP1 won by"}︡{"stdout":" 3 in 37 rounds with 39 tiles left in bag on a 20 by 16 board\nP1 won by"}︡{"stdout":" 1 in 37 rounds with 45 tiles left in bag on a 16 by 22 board\nP1 won by"}︡{"stdout":" 4 in 43 rounds with 40 tiles left in bag on a 16 by 17 board\nP2 won by"}︡{"stdout":" 4 in 32 rounds with 46 tiles left in bag on a 23 by 13 board\nP1 won by"}︡{"stdout":" 1 in 65 rounds with 22 tiles left in bag on a 25 by 29 board\nP2 won by"}︡{"stdout":" 1 in 48 rounds with 39 tiles left in bag on a 18 by 19 board\ndraw;\n"}︡{"stdout":"\nP1 won by"}︡{"stdout":" 2 in 45 rounds with 37 tiles left in bag on a 25 by 17 board\nP2 won by"}︡{"stdout":" 2 in 52 rounds with 32 tiles left in bag on a 17 by 27 board\nP1 won by"}︡{"stdout":" 5 in 53 rounds with 30 tiles left in bag on a 18 by 21 board\nP2 won by"}︡{"stdout":" 1 in 46 rounds with 39 tiles left in bag on a 16 by 21 board\nP1 won by"}︡{"stdout":" 1 in 77 rounds with 15 tiles left in bag on a 35 by 26 board\nP1 won by"}︡{"stdout":" 3 in 45 rounds with 35 tiles left in bag on a 18 by 26 board\nP2 won by"}︡{"stdout":" 4 in 32 rounds with 44 tiles left in bag on a 16 by 16 board\nP2 won by"}︡{"stdout":" 4 in 38 rounds with 39 tiles left in bag on a 15 by 18 board\nP2 won by"}︡{"stdout":" 2 in 80 rounds with 12 tiles left in bag on a 27 by 22 board\nP1 won by"}︡{"stdout":" 1 in 61 rounds with 24 tiles left in bag on a 25 by 22 board\ndraw"}︡{"stdout":"\nP2 won by"}︡{"stdout":" 1 in 58 rounds with 26 tiles left in bag on a 30 by 20 board\ndraw;\n"}︡{"stdout":"\ndraw"}︡{"stdout":"\nP1 won by"}︡{"stdout":" 1 in 45 rounds with 38 tiles left in bag on a 17 by 24 board\nP2 won by"}︡{"stdout":" 2 in 22 rounds with 53 tiles left in bag on a 13 by 14 board\nP2 won by"}︡{"stdout":" 1 in 66 rounds with 29 tiles left in bag on a 20 by 22 board\nP1 won by"}︡{"stdout":" 4 in 41 rounds with 36 tiles left in bag on a 23 by 16 board\nP2 won by"}︡{"stdout":" 2 in 56 rounds with 25 tiles left in bag on a 21 by 23 board\nP2 won by 2 in 16 rounds with 57 tiles left in bag on a 12 by 14 board\nP2 won by"}︡{"stdout":" 1 in 18 rounds with 56 tiles left in bag on a 14 by 12 board\nP1 won by"}︡{"stdout":" 4 in 33 rounds with 45 tiles left in bag on a 16 by 21 board\nP1 won by"}︡{"stdout":" 2 in 77 rounds with 11 tiles left in bag on a 28 by 24 board\nP2 won by"}︡{"stdout":" 1 in 58 rounds with 28 tiles left in bag on a 21 by 26 board\nP1 won by"}︡{"stdout":" 2 in 17 rounds with 56 tiles left in bag on a 15 by 13 board\nP2 won by"}︡{"stdout":" 2 in 54 rounds with 29 tiles left in bag on a 29 by 16 board\nP1 won by"}︡{"stdout":" 1 in 47 rounds with 40 tiles left in bag on a 18 by 19 board\nP2 won by"}︡{"stdout":" 4 in 36 rounds with 41 tiles left in bag on a 22 by 15 board\nP1 won by"}︡{"stdout":" 2 in 91 rounds with 5 tiles left in bag on a 34 by 23 board\nP2 won by"}︡{"stdout":" 1 in 100 rounds with 5 tiles left in bag on a 32 by 26 board\nP2 won by"}︡{"stdout":" 4 in 52 rounds with 30 tiles left in bag on a 19 by 22 board\nP1 won by"}︡{"stdout":" 3 in 35 rounds with 44 tiles left in bag on a 18 by 14 board\nP1 won by"}︡{"stdout":" 2 in 21 rounds with 54 tiles left in bag on a 13 by 16 board\nP1 won by"}︡{"stdout":" 2 in 65 rounds with 27 tiles left in bag on a 21 by 31 board\nP1 won by"}︡{"stdout":" 3 in 81 rounds with 18 tiles left in bag on a 30 by 18 board\nP1 won by"}︡{"stdout":" 2 in 79 rounds with 16 tiles left in bag on a 22 by 23 board\nP2 won by"}︡{"stdout":" 3 in 22 rounds with 53 tiles left in bag on a 16 by 14 board\nP1 won by"}︡{"stdout":" 1 in 75 rounds with 14 tiles left in bag on a 27 by 28 board\nP1 won by"}︡{"stdout":" 1 in 67 rounds with 25 tiles left in bag on a 24 by 23 board\nP2 won by"}︡{"stdout":" 2 in 108 rounds with 1 tiles left in bag on a 29 by 31 board\nP2 won by"}︡{"stdout":" 5 in 34 rounds with 43 tiles left in bag on a 20 by 18 board\nP2 won by"}︡{"stdout":" 2 in 36 rounds with 45 tiles left in bag on a 14 by 21 board\nP1 won by"}︡{"stdout":" 4 in 87 rounds with 5 tiles left in bag on a 30 by 31 board\nP2 won by"}︡{"stdout":" 2 in 26 rounds with 51 tiles left in bag on a 15 by 15 board\nP2 won by"}︡{"stdout":" 3 in 22 rounds with 53 tiles left in bag on a 14 by 16 board\nP2 won by"}︡{"stdout":" 3 in 48 rounds with 35 tiles left in bag on a 19 by 18 board\nP1 won by"}︡{"stdout":" 2 in 17 rounds with 56 tiles left in bag on a 15 by 11 board\nP2 won by"}︡{"stdout":" 4 in 16 rounds with 56 tiles left in bag on a 14 by 12 board\nP2 won by"}︡{"stdout":" 2 in 28 rounds with 48 tiles left in bag on a 19 by 14 board\nP2 won by"}︡{"stdout":" 3 in 24 rounds with 51 tiles left in bag on a 13 by 17 board\nP2 won by"}︡{"stdout":" 1 in 16 rounds with 57 tiles left in bag on a 9 by 17 board\nP1 won by"}︡{"stdout":" 1 in 85 rounds with 13 tiles left in bag on a 33 by 18 board\nP2 won by"}︡{"stdout":" 3 in 44 rounds with 36 tiles left in bag on a 19 by 28 board\ndraw;\n"}︡{"stdout":"\nP2 won by"}︡{"stdout":" 2 in 16 rounds with 57 tiles left in bag on a 12 by 13 board\nP1 won by"}︡{"stdout":" 2 in 57 rounds with 26 tiles left in bag on a 18 by 23 board\nP1 won by"}︡{"stdout":" 3 in 23 rounds with 52 tiles left in bag on a 19 by 10 board\nP1 won by"}︡{"stdout":" 2 in 53 rounds with 31 tiles left in bag on a 20 by 25 board\nP2 won by"}︡{"stdout":" 2 in 40 rounds with 41 tiles left in bag on a 21 by 15 board\nP2 won by"}︡{"stdout":" 1 in 32 rounds with 46 tiles left in bag on a 17 by 18 board\nP2 won by"}︡{"stdout":" 2 in 54 rounds with 35 tiles left in bag on a 19 by 21 board\nP1 won by"}︡{"stdout":" 4 in 39 rounds with 44 tiles left in bag on a 23 by 15 board\nP2 won by"}︡{"stdout":" 2 in 50 rounds with 37 tiles left in bag on a 21 by 19 board\nP1 won by"}︡{"stdout":" 1 in 49 rounds with 35 tiles left in bag on a 22 by 25 board\nP2 won by"}︡{"stdout":" 1 in 80 rounds with 15 tiles left in bag on a 29 by 20 board\nP1 won by"}︡{"stdout":" 3 in 41 rounds with 41 tiles left in bag on a 24 by 17 board\nP2 won by"}︡{"stdout":" 3 in 30 rounds with 47 tiles left in bag on a 18 by 15 board\nP2 won by"}︡{"stdout":" 1 in 48 rounds with 35 tiles left in bag on a 19 by 22 board\nP1 won by"}︡{"stdout":" 2 in 33 rounds with 46 tiles left in bag on a 17 by 21 board\nP2 won by"}︡{"stdout":" 2 in 36 rounds with 41 tiles left in bag on a 18 by 19 board\nP1 won by"}︡{"stdout":" 1 in 27 rounds with 50 tiles left in bag on a 19 by 13 board\nP1 won by"}︡{"stdout":" 1 in 35 rounds with 44 tiles left in bag on a 22 by 18 board\nP1 won by"}︡{"stdout":" 2 in 29 rounds with 49 tiles left in bag on a 15 by 16 board\nP2 won by"}︡{"stdout":" 3 in 64 rounds with 28 tiles left in bag on a 19 by 22 board\nP1 won by"}︡{"stdout":" 1 in 45 rounds with 38 tiles left in bag on a 19 by 17 board\nP2 won by"}︡{"stdout":" 3 in 48 rounds with 35 tiles left in bag on a 16 by 22 board\nP1 won by"}︡{"stdout":" 6 in 37 rounds with 42 tiles left in bag on a 15 by 16 board\nP1 won by"}︡{"stdout":" 1 in 53 rounds with 35 tiles left in bag on a 33 by 18 board\nP2 won by"}︡{"stdout":" 1 in 54 rounds with 32 tiles left in bag on a 19 by 22 board\nP1 won by"}︡{"stdout":" 1 in 81 rounds with 22 tiles left in bag on a 21 by 22 board\nP1 won by"}︡{"stdout":" 2 in 87 rounds with 8 tiles left in bag on a 28 by 26 board\nP1 won by"}︡{"stdout":" 4 in 31 rounds with 47 tiles left in bag on a 18 by 16 board\nP1 won by"}︡{"stdout":" 2 in 33 rounds with 48 tiles left in bag on a 20 by 13 board\nP2 won by 3 in 16 rounds with 56 tiles left in bag on a 13 by 14 board\nP2 won by"}︡{"stdout":" 3 in 30 rounds with 46 tiles left in bag on a 18 by 15 board\nP1 won by"}︡{"stdout":" 2 in 21 rounds with 53 tiles left in bag on a 14 by 12 board\nP1 won by"}︡{"stdout":" 1 in 57 rounds with 26 tiles left in bag on a 19 by 25 board\nP1 won by"}︡{"stdout":" 1 in 33 rounds with 46 tiles left in bag on a 15 by 20 board\nP1 won by"}︡{"stdout":" 1 in 33 rounds with 47 tiles left in bag on a 22 by 16 board\nP1 won by"}︡{"stdout":" 2 in 95 rounds with 4 tiles left in bag on a 23 by 29 board\nP1 won by"}︡{"stdout":" 2 in 57 rounds with 30 tiles left in bag on a 21 by 24 board\nP2 won by"}︡{"stdout":" 2 in 70 rounds with 21 tiles left in bag on a 29 by 19 board\nP2 won by"}︡{"stdout":" 2 in 42 rounds with 42 tiles left in bag on a 17 by 17 board\nP1 won by"}︡{"stdout":" 4 in 29 rounds with 48 tiles left in bag on a 20 by 13 board\ndraw"}︡{"stdout":"\nP2 won by"}︡{"stdout":" 2 in 66 rounds with 25 tiles left in bag on a 21 by 19 board\nP1 won by"}︡{"stdout":" 4 in 15 rounds with 56 tiles left in bag on a 11 by 19 board\nP1 won by"}︡{"stdout":" 2 in 81 rounds with 11 tiles left in bag on a 27 by 25 board\nP1 won by"}︡{"stdout":" 3 in 49 rounds with 38 tiles left in bag on a 18 by 17 board\nP1 won by"}︡{"stdout":" 4 in 49 rounds with 39 tiles left in bag on a 19 by 16 board\nP2 won by"}︡{"stdout":" 1 in 74 rounds with 18 tiles left in bag on a 23 by 23 board\ndraw;\n"}︡{"stdout":"\nP2 won by"}︡{"stdout":" 1 in 100 rounds with 2 tiles left in bag on a 33 by 23 board\nP1 won by"}︡{"stdout":" 1 in 63 rounds with 26 tiles left in bag on a 22 by 18 board\nP1 won by"}︡{"stdout":" 4 in 53 rounds with 33 tiles left in bag on a 20 by 18 board\nP1 won by"}︡{"stdout":" 3 in 63 rounds with 22 tiles left in bag on a 27 by 26 board\ndraw"}︡{"stdout":"\nP1 won by"}︡{"stdout":" 5 in 27 rounds with 48 tiles left in bag on a 17 by 14 board\nP1 won by"}︡{"stdout":" 4 in 29 rounds with 44 tiles left in bag on a 16 by 15 board\nP2 won by"}︡{"stdout":" 3 in 26 rounds with 50 tiles left in bag on a 10 by 19 board\nP2 won by"}︡{"stdout":" 6 in 20 rounds with 52 tiles left in bag on a 12 by 15 board\nP1 won by"}︡{"stdout":" 2 in 51 rounds with 36 tiles left in bag on a 20 by 18 board\nP1 won by"}︡{"stdout":" 4 in 51 rounds with 35 tiles left in bag on a 22 by 17 board\nP1 won by"}︡{"stdout":" 5 in 79 rounds with 16 tiles left in bag on a 29 by 18 board\nP1 won by"}︡{"stdout":" 1 in 97 rounds with 8 tiles left in bag on a 31 by 26 board\nP1 won by"}︡{"stdout":" 3 in 47 rounds with 34 tiles left in bag on a 22 by 18 board\nP1 won by"}︡{"stdout":" 1 in 45 rounds with 41 tiles left in bag on a 19 by 19 board\nP1 won by"}︡{"stdout":" 2 in 37 rounds with 44 tiles left in bag on a 14 by 18 board\nP2 won by"}︡{"stdout":" 4 in 32 rounds with 43 tiles left in bag on a 14 by 19 board\nP2 won by"}︡{"stdout":" 3 in 60 rounds with 30 tiles left in bag on a 18 by 28 board\nP1 won by"}︡{"stdout":" 3 in 69 rounds with 25 tiles left in bag on a 25 by 20 board\nP1 won by"}︡{"stdout":" 4 in 33 rounds with 47 tiles left in bag on a 15 by 14 board\nP1 won by"}︡{"stdout":" 1 in 27 rounds with 51 tiles left in bag on a 13 by 18 board\nP2 won by"}︡{"stdout":" 3 in 82 rounds with 7 tiles left in bag on a 22 by 27 board\nP2 won by"}︡{"stdout":" 1 in 22 rounds with 54 tiles left in bag on a 13 by 18 board\nP2 won by"}︡{"stdout":" 5 in 64 rounds with 26 tiles left in bag on a 22 by 18 board\nP2 won by"}︡{"stdout":" 3 in 60 rounds with 29 tiles left in bag on a 20 by 24 board\nP2 won by"}︡{"stdout":" 3 in 58 rounds with 26 tiles left in bag on a 18 by 20 board\nP1 won by"}︡{"stdout":" 1 in 25 rounds with 50 tiles left in bag on a 17 by 16 board\nP1 won by"}︡{"stdout":" 3 in 15 rounds with 57 tiles left in bag on a 12 by 13 board\nP2 won by"}︡{"stdout":" 2 in 76 rounds with 20 tiles left in bag on a 35 by 21 board\nP1 won by"}︡{"stdout":" 1 in 97 rounds with 13 tiles left in bag on a 26 by 24 board\nP1 won by"}︡{"stdout":" 1 in 69 rounds with 22 tiles left in bag on a 24 by 26 board\nP2 won by"}︡{"stdout":" 2 in 52 rounds with 34 tiles left in bag on a 22 by 17 board\nP1 won by"}︡{"stdout":" 5 in 51 rounds with 32 tiles left in bag on a 22 by 18 board\nP2 won by"}︡{"stdout":" 1 in 66 rounds with 25 tiles left in bag on a 22 by 19 board\nP2 won by"}︡{"stdout":" 2 in 56 rounds with 26 tiles left in bag on a 21 by 28 board\nP1 won by"}︡{"stdout":" 2 in 17 rounds with 55 tiles left in bag on a 13 by 13 board\nP1 won by"}︡{"stdout":" 2 in 77 rounds with 22 tiles left in bag on a 25 by 24 board\nP1 won by"}︡{"stdout":" 2 in 83 rounds with 17 tiles left in bag on a 22 by 29 board\nP1 won by"}︡{"stdout":" 2 in 31 rounds with 48 tiles left in bag on a 21 by 16 board\nP2 won by"}︡{"stdout":" 1 in 68 rounds with 27 tiles left in bag on a 18 by 26 board\nP1 won by"}︡{"stdout":" 3 in 29 rounds with 48 tiles left in bag on a 15 by 21 board\nP1 won by"}︡{"stdout":" 4 in 39 rounds with 39 tiles left in bag on a 14 by 21 board\nP1 won by"}︡{"stdout":" 4 in 63 rounds with 25 tiles left in bag on a 32 by 22 board\nP2 won by"}︡{"stdout":" 2 in 60 rounds with 27 tiles left in bag on a 26 by 18 board\nP2 won by"}︡{"stdout":" 3 in 32 rounds with 44 tiles left in bag on a 16 by 17 board\nP1 won by"}︡{"stdout":" 1 in 65 rounds with 23 tiles left in bag on a 26 by 18 board\nP2 won by"}︡{"stdout":" 1 in 76 rounds with 14 tiles left in bag on a 28 by 25 board\nP2 won by"}︡{"stdout":" 1 in 86 rounds with 9 tiles left in bag on a 20 by 30 board\nP2 won by"}︡{"stdout":" 2 in 64 rounds with 26 tiles left in bag on a 25 by 22 board\nP2 won by"}︡{"stdout":" 4 in 38 rounds with 43 tiles left in bag on a 19 by 15 board\nP1 won by"}︡{"stdout":" 2 in 45 rounds with 37 tiles left in bag on a 16 by 19 board\nP2 won by"}︡{"stdout":" 4 in 34 rounds with 42 tiles left in bag on a 18 by 18 board\nP1 won by"}︡{"stdout":" 1 in 103 rounds with 6 tiles left in bag on a 32 by 28 board\nP1 won by"}︡{"stdout":" 1 in 59 rounds with 31 tiles left in bag on a 25 by 17 board\nP2 won by"}︡{"stdout":" 4 in 20 rounds with 53 tiles left in bag on a 14 by 14 board\nP1 won by"}︡{"stdout":" 1 in 61 rounds with 25 tiles left in bag on a 20 by 20 board\nP2 won by"}︡{"stdout":" 3 in 38 rounds with 40 tiles left in bag on a 15 by 19 board\nP1 won by"}︡{"stdout":" 2 in 27 rounds with 49 tiles left in bag on a 19 by 15 board\nP1 won by"}︡{"stdout":" 2 in 47 rounds with 39 tiles left in bag on a 19 by 18 board\nP2 won by"}︡{"stdout":" 6 in 16 rounds with 55 tiles left in bag on a 13 by 10 board\nP1 won by"}︡{"stdout":" 2 in 71 rounds with 24 tiles left in bag on a 30 by 16 board\nP2 won by"}︡{"stdout":" 5 in 32 rounds with 46 tiles left in bag on a 19 by 17 board\nP2 won by"}︡{"stdout":" 4 in 30 rounds with 46 tiles left in bag on a 15 by 14 board\nP1 won by"}︡{"stdout":" 3 in 17 rounds with 55 tiles left in bag on a 10 by 15 board\nP1 won by"}︡{"stdout":" 2 in 59 rounds with 32 tiles left in bag on a 25 by 21 board\ndraw"}︡{"stdout":"\nP1 won by"}︡{"stdout":" 1 in 49 rounds with 37 tiles left in bag on a 18 by 20 board\nP1 won by"}︡{"stdout":" 1 in 37 rounds with 44 tiles left in bag on a 14 by 16 board\nP2 won by"}︡{"stdout":" 6 in 22 rounds with 50 tiles left in bag on a 13 by 16 board\nP2 won by 3 in 16 rounds with 56 tiles left in bag on a 12 by 14 board\nP2 won by"}︡{"stdout":" 2 in 62 rounds with 27 tiles left in bag on a 17 by 24 board\nP2 won by"}︡{"stdout":" 2 in 52 rounds with 32 tiles left in bag on a 22 by 17 board\nP1 won by"}︡{"stdout":" 1 in 21 rounds with 53 tiles left in bag on a 15 by 14 board\nP1 won by"}︡{"stdout":" 1 in 93 rounds with 7 tiles left in bag on a 25 by 24 board\ndraw;\n"}︡{"stdout":"\nP1 won by"}︡{"stdout":" 1 in 61 rounds with 28 tiles left in bag on a 21 by 23 board\nP2 won by"}︡{"stdout":" 2 in 38 rounds with 43 tiles left in bag on a 19 by 17 board\nP2 won by"}︡{"stdout":" 3 in 24 rounds with 51 tiles left in bag on a 14 by 14 board\nP2 won by"}︡{"stdout":" 2 in 76 rounds with 16 tiles left in bag on a 34 by 22 board\nP2 won by"}︡{"stdout":" 2 in 80 rounds with 19 tiles left in bag on a 34 by 16 board\nP1 won by"}︡{"stdout":" 2 in 33 rounds with 46 tiles left in bag on a 17 by 14 board\nP1 won by"}︡{"stdout":" 3 in 15 rounds with 57 tiles left in bag on a 13 by 11 board\nP2 won by"}︡{"stdout":" 3 in 20 rounds with 53 tiles left in bag on a 14 by 15 board\nP2 won by"}︡{"stdout":" 2 in 82 rounds with 22 tiles left in bag on a 27 by 25 board\nP2 won by"}︡{"stdout":" 1 in 74 rounds with 27 tiles left in bag on a 28 by 17 board\nP1 won by"}︡{"stdout":" 2 in 73 rounds with 17 tiles left in bag on a 26 by 19 board\nP1 won by"}︡{"stdout":" 5 in 15 rounds with 56 tiles left in bag on a 14 by 12 board\nP2 won by"}︡{"stdout":" 3 in 36 rounds with 44 tiles left in bag on a 18 by 15 board\nP2 won by"}︡{"stdout":" 4 in 30 rounds with 47 tiles left in bag on a 20 by 17 board\nP2 won by"}︡{"stdout":" 4 in 16 rounds with 56 tiles left in bag on a 16 by 11 board\nP2 won by"}︡{"stdout":" 1 in 74 rounds with 19 tiles left in bag on a 24 by 28 board\nP2 won by"}︡{"stdout":" 1 in 72 rounds with 18 tiles left in bag on a 21 by 29 board\nP1 won by"}︡{"stdout":" 2 in 59 rounds with 30 tiles left in bag on a 24 by 18 board\nP2 won by"}︡{"stdout":" 2 in 38 rounds with 41 tiles left in bag on a 17 by 17 board\nP1 won by"}︡{"stdout":" 2 in 45 rounds with 41 tiles left in bag on a 19 by 17 board\nP1 won by"}︡{"stdout":" 5 in 35 rounds with 44 tiles left in bag on a 19 by 18 board\nP2 won by"}︡{"stdout":" 3 in 32 rounds with 43 tiles left in bag on a 17 by 19 board\nP1 won by"}︡{"stdout":" 4 in 51 rounds with 35 tiles left in bag on a 16 by 24 board\nP2 won by"}︡{"stdout":" 1 in 64 rounds with 28 tiles left in bag on a 22 by 17 board\nP2 won by"}︡{"stdout":" 1 in 36 rounds with 45 tiles left in bag on a 16 by 18 board\nP2 won by"}︡{"stdout":" 1 in 66 rounds with 27 tiles left in bag on a 23 by 19 board\nP1 won by"}︡{"stdout":" 3 in 83 rounds with 9 tiles left in bag on a 26 by 25 board\nP2 won by"}︡{"stdout":" 1 in 60 rounds with 28 tiles left in bag on a 26 by 16 board\nP2 won by"}︡{"stdout":" 1 in 56 rounds with 33 tiles left in bag on a 24 by 21 board\nP1 won by"}︡{"stdout":" 2 in 67 rounds with 25 tiles left in bag on a 31 by 18 board\nP2 won by"}︡{"stdout":" 3 in 36 rounds with 44 tiles left in bag on a 18 by 15 board\nP1 won by"}︡{"stdout":" 1 in 31 rounds with 46 tiles left in bag on a 15 by 17 board\nP2 won by"}︡{"stdout":" 4 in 52 rounds with 35 tiles left in bag on a 21 by 25 board\nP2 won by"}︡{"stdout":" 1 in 50 rounds with 30 tiles left in bag on a 19 by 27 board\nP1 won by"}︡{"stdout":" 2 in 57 rounds with 33 tiles left in bag on a 24 by 18 board\nP1 won by"}︡{"stdout":" 2 in 61 rounds with 27 tiles left in bag on a 26 by 20 board\nP2 won by"}︡{"stdout":" 4 in 50 rounds with 32 tiles left in bag on a 19 by 18 board\nP2 won by"}︡{"stdout":" 4 in 32 rounds with 43 tiles left in bag on a 17 by 17 board\nP2 won by"}︡{"stdout":" 1 in 44 rounds with 37 tiles left in bag on a 20 by 21 board\nP2 won by"}︡{"stdout":" 3 in 66 rounds with 24 tiles left in bag on a 30 by 20 board\nP2 won by"}︡{"stdout":" 1 in 90 rounds with 7 tiles left in bag on a 29 by 24 board\nP2 won by"}︡{"stdout":" 1 in 62 rounds with 26 tiles left in bag on a 24 by 16 board\nP1 won by"}︡{"stdout":" 4 in 37 rounds with 43 tiles left in bag on a 15 by 20 board\nP1 won by"}︡{"stdout":" 2 in 41 rounds with 43 tiles left in bag on a 16 by 20 board\nP2 won by"}︡{"stdout":" 5 in 28 rounds with 48 tiles left in bag on a 16 by 14 board\nP1 won by"}︡{"stdout":" 2 in 27 rounds with 48 tiles left in bag on a 15 by 17 board\nP2 won by"}︡{"stdout":" 2 in 58 rounds with 26 tiles left in bag on a 26 by 22 board\nP2 won by"}︡{"stdout":" 2 in 30 rounds with 49 tiles left in bag on a 18 by 13 board\nP2 won by"}︡{"stdout":" 2 in 38 rounds with 43 tiles left in bag on a 22 by 16 board\nP2 won by"}︡{"stdout":" 2 in 26 rounds with 48 tiles left in bag on a 15 by 14 board\nP2 won by"}︡{"stdout":" 1 in 84 rounds with 10 tiles left in bag on a 27 by 31 board\nP2 won by"}︡{"stdout":" 2 in 64 rounds with 25 tiles left in bag on a 20 by 20 board\nP2 won by"}︡{"stdout":" 2 in 36 rounds with 43 tiles left in bag on a 15 by 19 board\nP1 won by"}︡{"stdout":" 1 in 89 rounds with 10 tiles left in bag on a 28 by 29 board\nP2 won by"}︡{"stdout":" 2 in 64 rounds with 28 tiles left in bag on a 19 by 27 board\nP2 won by"}︡{"stdout":" 4 in 46 rounds with 37 tiles left in bag on a 24 by 19 board\nP1 won by"}︡{"stdout":" 2 in 17 rounds with 56 tiles left in bag on a 17 by 11 board\nP1 won by"}︡{"stdout":" 1 in 43 rounds with 40 tiles left in bag on a 19 by 13 board\nP1 won by"}︡{"stdout":" 2 in 43 rounds with 38 tiles left in bag on a 18 by 15 board\nP1 won by"}︡{"stdout":" "}︡{"stdout":"1 in 61 rounds with 27 tiles left in bag on a 22 by 24 board\nP1 won by"}︡{"stdout":" 2 in 17 rounds with 56 tiles left in bag on a 14 by 15 board\nP2 won by"}︡{"stdout":" 1 in 30 rounds with 49 tiles left in bag on a 15 by 19 board\nP2 won by"}︡{"stdout":" 1 in 68 rounds with 19 tiles left in bag on a 27 by 18 board\nP2 won by"}︡{"stdout":" 1 in 64 rounds with 28 tiles left in bag on a 19 by 24 board\nP1 won by"}︡{"stdout":" 3 in 65 rounds with 23 tiles left in bag on a 21 by 21 board\nP1 won by"}︡{"stdout":" 1 in 49 rounds with 37 tiles left in bag on a 18 by 19 board\nP2 won by"}︡{"stdout":" 2 in 22 rounds with 53 tiles left in bag on a 12 by 16 board\nP2 won by"}︡{"stdout":" 2 in 58 rounds with 30 tiles left in bag on a 20 by 21 board\nP1 won by"}︡{"stdout":" 2 in 35 rounds with 44 tiles left in bag on a 17 by 19 board\nP1 won by"}︡{"stdout":" 1 in 25 rounds with 50 tiles left in bag on a 13 by 16 board\nP1 won by"}︡{"stdout":" 2 in 19 rounds with 54 tiles left in bag on a 14 by 11 board\nP1 won by"}︡{"stdout":" 4 in 33 rounds with 44 tiles left in bag on a 20 by 18 board\nP1 won by"}︡{"stdout":" 2 in 63 rounds with 30 tiles left in bag on a 31 by 25 board\nP2 won by"}︡{"stdout":" 2 in 22 rounds with 53 tiles left in bag on a 15 by 13 board\nP1 won by 1 in 15 rounds with 58 tiles left in bag on a 13 by 18 board\nP1 won by"}︡{"stdout":" 1 in 27 rounds with 48 tiles left in bag on a 12 by 16 board\nP2 won by"}︡{"stdout":" 1 in 50 rounds with 35 tiles left in bag on a 18 by 26 board\nP2 won by"}︡{"stdout":" 2 in 32 rounds with 46 tiles left in bag on a 16 by 17 board\nP2 won by"}︡{"stdout":" 1 in 96 rounds with 4 tiles left in bag on a 30 by 27 board\nP1 won by"}︡{"stdout":" 1 in 85 rounds with 16 tiles left in bag on a 23 by 22 board\nP2 won by"}︡{"stdout":" 3 in 82 rounds with 15 tiles left in bag on a 27 by 22 board\nP2 won by"}︡{"stdout":" 3 in 72 rounds with 19 tiles left in bag on a 25 by 23 board\nP2 won by"}︡{"stdout":" 5 in 32 rounds with 46 tiles left in bag on a 15 by 23 board\nP2 won by"}︡{"stdout":" 1 in 66 rounds with 20 tiles left in bag on a 21 by 26 board\ndraw;\n"}︡{"stdout":"\nP1 won by"}︡{"stdout":" 2 in 25 rounds with 49 tiles left in bag on a 19 by 14 board\nP1 won by"}︡{"stdout":" 3 in 49 rounds with 33 tiles left in bag on a 17 by 21 board\nP1 won by"}︡{"stdout":" 2 in 33 rounds with 46 tiles left in bag on a 16 by 17 board\nP2 won by"}︡{"stdout":" 9 in 62 rounds with 20 tiles left in bag on a 23 by 23 board\nP1 won by"}︡{"stdout":" 2 in 83 rounds with 11 tiles left in bag on a 26 by 20 board\nP1 won by"}︡{"stdout":" 1 in 41 rounds with 38 tiles left in bag on a 16 by 20 board\nP2 won by"}︡{"stdout":" 5 in 16 rounds with 55 tiles left in bag on a 11 by 12 board\ndraw"}︡{"stdout":"\nP1 won by"}︡{"stdout":" 4 in 87 rounds with 9 tiles left in bag on a 22 by 35 board\nP1 won by"}︡{"stdout":" 1 in 37 rounds with 43 tiles left in bag on a 18 by 22 board\nP2 won by"}︡{"stdout":" 2 in 40 rounds with 43 tiles left in bag on a 16 by 16 board\nP2 won by"}︡{"stdout":" 2 in 16 rounds with 57 tiles left in bag on a 13 by 15 board\nP2 won by"}︡{"stdout":" 4 in 66 rounds with 23 tiles left in bag on a 28 by 19 board\nP2 won by"}︡{"stdout":" 2 in 16 rounds with 57 tiles left in bag on a 10 by 17 board\nP1 won by"}︡{"stdout":" 3 in 81 rounds with 15 tiles left in bag on a 31 by 26 board\nP2 won by"}︡{"stdout":" 5 in 28 rounds with 47 tiles left in bag on a 11 by 21 board\nP1 won by"}︡{"stdout":" 6 in 15 rounds with 54 tiles left in bag on a 10 by 13 board\nP1 won by"}︡{"stdout":" 1 in 71 rounds with 19 tiles left in bag on a 21 by 30 board\ndraw;\n"}︡{"stdout":"\nP2 won by"}︡{"stdout":" 1 in 32 rounds with 45 tiles left in bag on a 17 by 18 board\nP1 won by"}︡{"stdout":" 3 in 21 rounds with 53 tiles left in bag on a 13 by 15 board\nP1 won by"}︡{"stdout":" 4 in 45 rounds with 35 tiles left in bag on a 19 by 17 board\nP1 won by"}︡{"stdout":" 2 in 19 rounds with 54 tiles left in bag on a 12 by 17 board\nP2 won by"}︡{"stdout":" 2 in 46 rounds with 38 tiles left in bag on a 18 by 18 board\nP1 won by"}︡{"stdout":" 6 in 25 rounds with 49 tiles left in bag on a 11 by 16 board\nP2 won by"}︡{"stdout":" 2 in 48 rounds with 36 tiles left in bag on a 18 by 22 board\nP2 won by"}︡{"stdout":" 1 in 28 rounds with 49 tiles left in bag on a 16 by 13 board\nP1 won by"}︡{"stdout":" 1 in 65 rounds with 25 tiles left in bag on a 26 by 22 board\nP2 won by"}︡{"stdout":" 3 in 74 rounds with 18 tiles left in bag on a 21 by 24 board\nP1 won by"}︡{"stdout":" 1 in 93 rounds with 5 tiles left in bag on a 32 by 20 board\nP2 won by"}︡{"stdout":" 2 in 50 rounds with 34 tiles left in bag on a 22 by 26 board\nP2 won by"}︡{"stdout":" 1 in 82 rounds with 11 tiles left in bag on a 23 by 26 board\nP2 won by"}︡{"stdout":" 4 in 38 rounds with 43 tiles left in bag on a 20 by 17 board\nP1 won by"}︡{"stdout":" 2 in 61 rounds with 26 tiles left in bag on a 19 by 22 board\nP1 won by"}︡{"stdout":" 1 in 33 rounds with 47 tiles left in bag on a 17 by 12 board\nP1 won by"}︡{"stdout":" 2 in 45 rounds with 39 tiles left in bag on a 19 by 17 board\nP2 won by"}︡{"stdout":" 1 in 22 rounds with 53 tiles left in bag on a 15 by 17 board\nP1 won by"}︡{"stdout":" 9 in 49 rounds with 32 tiles left in bag on a 25 by 19 board\nP2 won by 1 in 16 rounds with 57 tiles left in bag on a 14 by 14 board\nP1 won by"}︡{"stdout":" 5 in 25 rounds with 49 tiles left in bag on a 21 by 10 board\nP1 won by"}︡{"stdout":" 2 in 51 rounds with 36 tiles left in bag on a 17 by 22 board\nP1 won by"}︡{"stdout":" 1 in 29 rounds with 49 tiles left in bag on a 18 by 13 board\nP2 won by"}︡{"stdout":" 5 in 28 rounds with 47 tiles left in bag on a 13 by 17 board\nP2 won by"}︡{"stdout":" 1 in 26 rounds with 50 tiles left in bag on a 12 by 19 board\nP2 won by"}︡{"stdout":" 3 in 36 rounds with 44 tiles left in bag on a 16 by 19 board\nP1 won by 3 in 15 rounds with 57 tiles left in bag on a 15 by 14 board\nP2 won by"}︡{"stdout":" 1 in 24 rounds with 52 tiles left in bag on a 13 by 17 board\nP1 won by"}︡{"stdout":" 3 in 27 rounds with 47 tiles left in bag on a 16 by 17 board\nP2 won by"}︡{"stdout":" 5 in 28 rounds with 48 tiles left in bag on a 19 by 16 board\nP1 won by"}︡{"stdout":" 1 in 79 rounds with 22 tiles left in bag on a 25 by 24 board\nP2 won by"}︡{"stdout":" 2 in 86 rounds with 5 tiles left in bag on a 29 by 27 board\nP1 won by"}︡{"stdout":" 1 in 33 rounds with 47 tiles left in bag on a 19 by 13 board\nP1 won by"}︡{"stdout":" 2 in 39 rounds with 39 tiles left in bag on a 16 by 23 board\nP2 won by"}︡{"stdout":" 5 in 52 rounds with 30 tiles left in bag on a 19 by 19 board\nP2 won by"}︡{"stdout":" 1 in 84 rounds with 13 tiles left in bag on a 26 by 24 board\nP1 won by"}︡{"stdout":" 4 in 49 rounds with 38 tiles left in bag on a 21 by 15 board\nP1 won by"}︡{"stdout":" 4 in 43 rounds with 38 tiles left in bag on a 19 by 20 board\nP1 won by"}︡{"stdout":" 1 in 41 rounds with 44 tiles left in bag on a 18 by 14 board\nP1 won by"}︡{"stdout":" 1 in 21 rounds with 54 tiles left in bag on a 12 by 13 board\nP2 won by"}︡{"stdout":" 2 in 68 rounds with 25 tiles left in bag on a 21 by 23 board\nP2 won by"}︡{"stdout":" 2 in 42 rounds with 41 tiles left in bag on a 22 by 16 board\nP1 won by"}︡{"stdout":" 3 in 31 rounds with 47 tiles left in bag on a 27 by 17 board\nP1 won by"}︡{"stdout":" 2 in 23 rounds with 51 tiles left in bag on a 12 by 15 board\nP1 won by"}︡{"stdout":" 3 in 29 rounds with 45 tiles left in bag on a 15 by 20 board\nP2 won by"}︡{"stdout":" 3 in 56 rounds with 30 tiles left in bag on a 19 by 21 board\nP1 won by"}︡{"stdout":" 5 in 17 rounds with 53 tiles left in bag on a 15 by 14 board\nP1 won by"}︡{"stdout":" 9 in 15 rounds with 53 tiles left in bag on a 12 by 12 board\nP1 won by"}︡{"stdout":" 3 in 15 rounds with 56 tiles left in bag on a 12 by 14 board\nP1 won by"}︡{"stdout":" 2 in 77 rounds with 16 tiles left in bag on a 29 by 20 board\nP2 won by"}︡{"stdout":" 1 in 84 rounds with 8 tiles left in bag on a 28 by 27 board\nP1 won by"}︡{"stdout":" 3 in 25 rounds with 50 tiles left in bag on a 15 by 17 board\nP2 won by"}︡{"stdout":" 3 in 40 rounds with 39 tiles left in bag on a 17 by 22 board\nP2 won by"}︡{"stdout":" 1 in 48 rounds with 37 tiles left in bag on a 24 by 13 board\nP1 won by"}︡{"stdout":" 1 in 61 rounds with 30 tiles left in bag on a 23 by 21 board\nP1 won by"}︡{"stdout":" 3 in 47 rounds with 38 tiles left in bag on a 16 by 20 board\nP1 won by"}︡{"stdout":" 2 in 39 rounds with 40 tiles left in bag on a 18 by 19 board\nP2 won by"}︡{"stdout":" 4 in 16 rounds with 55 tiles left in bag on a 12 by 16 board\nP2 won by"}︡{"stdout":" 2 in 60 rounds with 29 tiles left in bag on a 16 by 23 board\nP2 won by"}︡{"stdout":" 1 in 20 rounds with 54 tiles left in bag on a 13 by 13 board\ndraw;\n"}︡{"stdout":"\nP2 won by"}︡{"stdout":" 4 in 28 rounds with 49 tiles left in bag on a 16 by 14 board\nP2 won by"}︡{"stdout":" 1 in 80 rounds with 10 tiles left in bag on a 24 by 24 board\nP1 won by"}︡{"stdout":" 3 in 55 rounds with 30 tiles left in bag on a 25 by 23 board\nP1 won by"}︡{"stdout":" 3 in 39 rounds with 43 tiles left in bag on a 15 by 26 board\nP2 won by"}︡{"stdout":" 4 in 16 rounds with 56 tiles left in bag on a 10 by 13 board\nP1 won by"}︡{"stdout":" 7 in 15 rounds with 55 tiles left in bag on a 13 by 13 board\nP2 won by"}︡{"stdout":" 2 in 22 rounds with 52 tiles left in bag on a 14 by 14 board\nP2 won by"}︡{"stdout":" 1 in 94 rounds with 3 tiles left in bag on a 39 by 22 board\nP2 won by"}︡{"stdout":" 1 in 82 rounds with 19 tiles left in bag on a 30 by 23 board\nP2 won by"}︡{"stdout":" 2 in 76 rounds with 12 tiles left in bag on a 25 by 23 board\nP1 won by"}︡{"stdout":" 5 in 33 rounds with 43 tiles left in bag on a 15 by 18 board\nP1 won by"}︡{"stdout":" 2 in 97 rounds with 7 tiles left in bag on a 28 by 25 board\nP2 won by"}︡{"stdout":" 3 in 70 rounds with 21 tiles left in bag on a 21 by 24 board\nP1 won by"}︡{"stdout":" 3 in 69 rounds with 23 tiles left in bag on a 20 by 30 board\nP1 won by"}︡{"stdout":" 2 in 23 rounds with 51 tiles left in bag on a 11 by 20 board\nP2 won by"}︡{"stdout":" 2 in 86 rounds with 11 tiles left in bag on a 32 by 23 board\nP1 won by"}︡{"stdout":" 2 in 69 rounds with 21 tiles left in bag on a 22 by 21 board\nP1 won by"}︡{"stdout":" 3 in 23 rounds with 50 tiles left in bag on a 13 by 15 board\nP2 won by"}︡{"stdout":" 4 in 58 rounds with 29 tiles left in bag on a 24 by 23 board\nP1 won by 3 in 15 rounds with 57 tiles left in bag on a 15 by 11 board\nP1 won by"}︡{"stdout":" 2 in 59 rounds with 26 tiles left in bag on a 23 by 23 board\nP1 won by"}︡{"stdout":" 4 in 61 rounds with 29 tiles left in bag on a 22 by 24 board\nP2 won by"}︡{"stdout":" 2 in 42 rounds with 38 tiles left in bag on a 16 by 19 board\nP1 won by"}︡{"stdout":" 1 in 15 rounds with 58 tiles left in bag on a 10 by 16 board\nP1 won by"}︡{"stdout":" 2 in 49 rounds with 34 tiles left in bag on a 21 by 23 board\nP1 won by"}︡{"stdout":" 4 in 15 rounds with 56 tiles left in bag on a 13 by 13 board\nP2 won by"}︡{"stdout":" 4 in 86 rounds with 5 tiles left in bag on a 29 by 24 board\nP2 won by"}︡{"stdout":" 5 in 18 rounds with 53 tiles left in bag on a 17 by 12 board\nP2 won by"}︡{"stdout":" 1 in 74 rounds with 21 tiles left in bag on a 19 by 23 board\nP1 won by"}︡{"stdout":" 4 in 25 rounds with 50 tiles left in bag on a 14 by 14 board\nP2 won by"}︡{"stdout":" 6 in 60 rounds with 27 tiles left in bag on a 20 by 22 board\nP2 won by"}︡{"stdout":" 5 in 40 rounds with 39 tiles left in bag on a 16 by 22 board\nP1 won by"}︡{"stdout":" 3 in 29 rounds with 48 tiles left in bag on a 16 by 18 board\nP1 won by"}︡{"stdout":" 2 in 21 rounds with 53 tiles left in bag on a 14 by 15 board\nP1 won by"}︡{"stdout":" 3 in 19 rounds with 55 tiles left in bag on a 12 by 12 board\nP2 won by"}︡{"stdout":" 2 in 44 rounds with 37 tiles left in bag on a 23 by 17 board\nP1 won by"}︡{"stdout":" 1 in 67 rounds with 24 tiles left in bag on a 31 by 18 board\nP2 won by"}︡{"stdout":" 4 in 30 rounds with 45 tiles left in bag on a 16 by 20 board\nP2 won by"}︡{"stdout":" 1 in 24 rounds with 52 tiles left in bag on a 14 by 14 board\nP2 won by"}︡{"stdout":" 3 in 28 rounds with 47 tiles left in bag on a 14 by 16 board\nP1 won by"}︡{"stdout":" 3 in 19 rounds with 53 tiles left in bag on a 14 by 14 board\nP2 won by"}︡{"stdout":" 5 in 36 rounds with 41 tiles left in bag on a 18 by 16 board\ndraw"}︡{"stdout":"\nP1 won by"}︡{"stdout":" 1 in 47 rounds with 39 tiles left in bag on a 22 by 14 board\nP2 won by"}︡{"stdout":" 3 in 44 rounds with 36 tiles left in bag on a 20 by 18 board\nP1 won by"}︡{"stdout":" 4 in 43 rounds with 35 tiles left in bag on a 19 by 15 board\nP1 won by"}︡{"stdout":" 4 in 79 rounds with 14 tiles left in bag on a 20 by 24 board\nP2 won by"}︡{"stdout":" 5 in 38 rounds with 40 tiles left in bag on a 21 by 18 board\nP2 won by"}︡{"stdout":" 5 in 72 rounds with 19 tiles left in bag on a 22 by 25 board\nP1 won by"}︡{"stdout":" 2 in 101 rounds with 2 tiles left in bag on a 28 by 28 board\nP2 won by"}︡{"stdout":" 5 in 24 rounds with 48 tiles left in bag on a 17 by 15 board\nP2 won by"}︡{"stdout":" 1 in 88 rounds with 11 tiles left in bag on a 30 by 28 board\nP2 won by"}︡{"stdout":" 5 in 44 rounds with 38 tiles left in bag on a 16 by 20 board\nP2 won by"}︡{"stdout":" 3 in 22 rounds with 52 tiles left in bag on a 16 by 14 board\nP1 won by"}︡{"stdout":" 2 in 45 rounds with 39 tiles left in bag on a 22 by 16 board\nP1 won by"}︡{"stdout":" 1 in 69 rounds with 25 tiles left in bag on a 28 by 25 board\nP2 won by"}︡{"stdout":" 3 in 96 rounds with 5 tiles left in bag on a 19 by 31 board\nP2 won by"}︡{"stdout":" 3 in 56 rounds with 30 tiles left in bag on a 25 by 20 board\nP2 won by"}︡{"stdout":" 3 in 88 rounds with 12 tiles left in bag on a 25 by 26 board\nP2 won by"}︡{"stdout":" 2 in 76 rounds with 15 tiles left in bag on a 24 by 23 board\nP2 won by"}︡{"stdout":" 4 in 30 rounds with 47 tiles left in bag on a 15 by 16 board\nP1 won by"}︡{"stdout":" 1 in 81 rounds with 13 tiles left in bag on a 31 by 20 board\nP2 won by"}︡{"stdout":" 2 in 44 rounds with 40 tiles left in bag on a 18 by 17 board\nP1 won by"}︡{"stdout":" 3 in 53 rounds with 35 tiles left in bag on a 21 by 17 board\nP2 won by"}︡{"stdout":" 1 in 52 rounds with 34 tiles left in bag on a 19 by 26 board\nP2 won by 1 in 16 rounds with 57 tiles left in bag on a 14 by 15 board\nP2 won by"}︡{"stdout":" 3 in 44 rounds with 39 tiles left in bag on a 18 by 18 board\nP2 won by"}︡{"stdout":" 2 in 34 rounds with 44 tiles left in bag on a 15 by 17 board\nP2 won by"}︡{"stdout":" 3 in 20 rounds with 53 tiles left in bag on a 9 by 17 board\nP2 won by"}︡{"stdout":" 1 in 52 rounds with 36 tiles left in bag on a 16 by 22 board\nP2 won by"}︡{"stdout":" 1 in 56 rounds with 35 tiles left in bag on a 19 by 24 board\nP1 won by"}︡{"stdout":" 4 in 27 rounds with 49 tiles left in bag on a 14 by 15 board\nP1 won by"}︡{"stdout":" 1 in 21 rounds with 54 tiles left in bag on a 12 by 16 board\nP1 won by"}︡{"stdout":" 6 in 51 rounds with 33 tiles left in bag on a 18 by 20 board\nP2 won by"}︡{"stdout":" 1 in 64 rounds with 25 tiles left in bag on a 22 by 21 board\nP2 won by"}︡{"stdout":" 2 in 60 rounds with 31 tiles left in bag on a 17 by 21 board\nP2 won by"}︡{"stdout":" 1 in 66 rounds with 20 tiles left in bag on a 20 by 30 board\nP1 won by"}︡{"stdout":" 4 in 71 rounds with 28 tiles left in bag on a 24 by 23 board\nP2 won by"}︡{"stdout":" 1 in 82 rounds with 13 tiles left in bag on a 23 by 24 board\nP2 won by"}︡{"stdout":" 2 in 20 rounds with 54 tiles left in bag on a 11 by 16 board\nP2 won by"}︡{"stdout":" 1 in 92 rounds with 7 tiles left in bag on a 27 by 31 board\nP1 won by"}︡{"stdout":" 3 in 21 rounds with 53 tiles left in bag on a 11 by 18 board\nP2 won by"}︡{"stdout":" 1 in 26 rounds with 50 tiles left in bag on a 18 by 13 board\nP1 won by"}︡{"stdout":" 1 in 21 rounds with 54 tiles left in bag on a 15 by 17 board\nP1 won by"}︡{"stdout":" 1 in 55 rounds with 31 tiles left in bag on a 28 by 16 board\nP2 won by"}︡{"stdout":" 2 in 76 rounds with 19 tiles left in bag on a 37 by 27 board\nP1 won by"}︡{"stdout":" 4 in 17 rounds with 54 tiles left in bag on a 14 by 12 board\nP1 won by"}︡{"stdout":" 1 in 73 rounds with 21 tiles left in bag on a 33 by 19 board\nP2 won by"}︡{"stdout":" 3 in 26 rounds with 48 tiles left in bag on a 14 by 14 board\nP1 won by"}︡{"stdout":" 7 in 43 rounds with 36 tiles left in bag on a 17 by 21 board\nP2 won by 2 in 16 rounds with 57 tiles left in bag on a 8 by 18 board\nP1 won by"}︡{"stdout":" 2 in 33 rounds with 45 tiles left in bag on a 17 by 22 board\nP2 won by"}︡{"stdout":" 4 in 18 rounds with 54 tiles left in bag on a 15 by 14 board\nP1 won by"}︡{"stdout":" 4 in 47 rounds with 35 tiles left in bag on a 23 by 18 board\nP1 won by"}︡{"stdout":" 3 in 45 rounds with 40 tiles left in bag on a 23 by 15 board\nP2 won by"}︡{"stdout":" 1 in 94 rounds with 2 tiles left in bag on a 23 by 34 board\nP1 won by"}︡{"stdout":" 4 in 63 rounds with 22 tiles left in bag on a 22 by 23 board\nP2 won by"}︡{"stdout":" 1 in 58 rounds with 28 tiles left in bag on a 20 by 27 board\nP1 won by"}︡{"stdout":" 2 in 77 rounds with 8 tiles left in bag on a 30 by 22 board\nP1 won by"}︡{"stdout":" 5 in 47 rounds with 36 tiles left in bag on a 20 by 19 board\nP1 won by"}︡{"stdout":" 2 in 43 rounds with 39 tiles left in bag on a 20 by 18 board\nP1 won by"}︡{"stdout":" 1 in 29 rounds with 49 tiles left in bag on a 13 by 21 board\nP1 won by"}︡{"stdout":" 2 in 35 rounds with 44 tiles left in bag on a 19 by 17 board\nP2 won by"}︡{"stdout":" 2 in 20 rounds with 54 tiles left in bag on a 12 by 15 board\nP2 won by"}︡{"stdout":" 2 in 22 rounds with 53 tiles left in bag on a 18 by 14 board\nP1 won by"}︡{"stdout":" 1 in 83 rounds with 15 tiles left in bag on a 32 by 22 board\nP1 won by"}︡{"stdout":" 1 in 67 rounds with 22 tiles left in bag on a 24 by 22 board\nP1 won by"}︡{"stdout":" 2 in 79 rounds with 15 tiles left in bag on a 21 by 26 board\nP1 won by"}︡{"stdout":" 4 in 15 rounds with 55 tiles left in bag on a 10 by 15 board\nP1 won by"}︡{"stdout":" 2 in 59 rounds with 28 tiles left in bag on a 27 by 23 board\nP2 won by"}︡{"stdout":" 3 in 24 rounds with 51 tiles left in bag on a 16 by 16 board\nP1 won by"}︡{"stdout":" 2 in 49 rounds with 36 tiles left in bag on a 19 by 19 board\nP1 won by"}︡{"stdout":" 1 in 53 rounds with 32 tiles left in bag on a 18 by 21 board\nP1 won by"}︡{"stdout":" 2 in 61 rounds with 31 tiles left in bag on a 20 by 27 board\nP1 won by"}︡{"stdout":" 4 in 23 rounds with 51 tiles left in bag on a 15 by 16 board\nP2 won by"}︡{"stdout":" 5 in 34 rounds with 45 tiles left in bag on a 17 by 14 board\nP2 won by"}︡{"stdout":" 2 in 56 rounds with 31 tiles left in bag on a 24 by 16 board\nP2 won by"}︡{"stdout":" 2 in 66 rounds with 21 tiles left in bag on a 29 by 18 board\nP1 won by"}︡{"stdout":" 1 in 85 rounds with 9 tiles left in bag on a 24 by 26 board\nP2 won by"}︡{"stdout":" 2 in 20 rounds with 53 tiles left in bag on a 16 by 14 board\nP1 won by"}︡{"stdout":" 1 in 45 rounds with 42 tiles left in bag on a 18 by 20 board\nP2 won by"}︡{"stdout":" 2 in 72 rounds with 20 tiles left in bag on a 18 by 22 board\nP2 won by"}︡{"stdout":" 3 in 58 rounds with 30 tiles left in bag on a 18 by 20 board\nP1 won by"}︡{"stdout":" 2 in 51 rounds with 33 tiles left in bag on a 23 by 15 board\nP1 won by"}︡{"stdout":" 1 in 89 rounds with 10 tiles left in bag on a 36 by 21 board\nP2 won by"}︡{"stdout":" 1 in 30 rounds with 46 tiles left in bag on a 16 by 19 board\nP2 won by"}︡{"stdout":" 3 in 80 rounds with 17 tiles left in bag on a 26 by 20 board\nP1 won by"}︡{"stdout":" 1 in 23 rounds with 52 tiles left in bag on a 13 by 14 board\nP1 won by"}︡{"stdout":" 4 in 15 rounds with 56 tiles left in bag on a 10 by 16 board\nP2 won by"}︡{"stdout":" 1 in 46 rounds with 38 tiles left in bag on a 22 by 19 board\nP1 won by"}︡{"stdout":" 6 in 21 rounds with 52 tiles left in bag on a 14 by 11 board\nP2 won by"}︡{"stdout":" 2 in 48 rounds with 35 tiles left in bag on a 24 by 17 board\nP1 won by"}︡{"stdout":" 2 in 73 rounds with 14 tiles left in bag on a 25 by 28 board\nP2 won by"}︡{"stdout":" 2 in 80 rounds with 19 tiles left in bag on a 25 by 21 board\nP2 won by"}︡{"stdout":" 2 in 44 rounds with 37 tiles left in bag on a 15 by 25 board\nP2 won by"}︡{"stdout":" 2 in 74 rounds with 13 tiles left in bag on a 18 by 25 board\nP1 won by"}︡{"stdout":" 1 in 21 rounds with 52 tiles left in bag on a 15 by 13 board\nP2 won by"}︡{"stdout":" 1 in 68 rounds with 23 tiles left in bag on a 30 by 21 board\nP2 won by"}︡{"stdout":" 3 in 38 rounds with 42 tiles left in bag on a 16 by 17 board\nP1 won by"}︡{"stdout":" 2 in 47 rounds with 40 tiles left in bag on a 18 by 18 board\nP2 won by"}︡{"stdout":" 2 in 84 rounds with 10 tiles left in bag on a 23 by 28 board\nP1 won by"}︡{"stdout":" 3 in 15 rounds with 57 tiles left in bag on a 11 by 17 board\nP2 won by"}︡{"stdout":" 3 in 16 rounds with 56 tiles left in bag on a 12 by 13 board\nP2 won by"}︡{"stdout":" 2 in 40 rounds with 40 tiles left in bag on a 21 by 16 board\nP1 won by"}︡{"stdout":" 3 in 73 rounds with 14 tiles left in bag on a 19 by 30 board\nP2 won by"}︡{"stdout":" 3 in 40 rounds with 42 tiles left in bag on a 17 by 14 board\nP1 won by"}︡{"stdout":" 2 in 37 rounds with 40 tiles left in bag on a 17 by 19 board\nP1 won by"}︡{"stdout":" 2 in 43 rounds with 37 tiles left in bag on a 16 by 21 board\nP1 won by"}︡{"stdout":" 1 in 15 rounds with 58 tiles left in bag on a 13 by 12 board\nP2 won by 2 in 16 rounds with 57 tiles left in bag on a 13 by 15 board\nP2 won by"}︡{"stdout":" 2 in 52 rounds with 34 tiles left in bag on a 20 by 22 board\nP2 won by"}︡{"stdout":" 2 in 38 rounds with 44 tiles left in bag on a 18 by 17 board\nP1 won by"}︡{"stdout":" 3 in 25 rounds with 50 tiles left in bag on a 14 by 16 board\nP1 won by"}︡{"stdout":" 1 in 47 rounds with 40 tiles left in bag on a 22 by 15 board\nP1 won by"}︡{"stdout":" 5 in 27 rounds with 48 tiles left in bag on a 20 by 14 board\nP2 won by"}︡{"stdout":" 2 in 18 rounds with 55 tiles left in bag on a 13 by 18 board\nP1 won by"}︡{"stdout":" 1 in 21 rounds with 54 tiles left in bag on a 10 by 17 board\nP1 won by"}︡{"stdout":" 3 in 101 rounds with 8 tiles left in bag on a 29 by 23 board\nP2 won by"}︡{"stdout":" 2 in 64 rounds with 22 tiles left in bag on a 25 by 22 board\nP2 won by"}︡{"stdout":" 5 in 44 rounds with 37 tiles left in bag on a 21 by 14 board\nP2 won by"}︡{"stdout":" 2 in 62 rounds with 27 tiles left in bag on a 24 by 16 board\nP2 won by"}︡{"stdout":" 4 in 40 rounds with 40 tiles left in bag on a 16 by 17 board\nP2 won by"}︡{"stdout":" 2 in 40 rounds with 40 tiles left in bag on a 15 by 22 board\nP1 won by"}︡{"stdout":" 2 in 45 rounds with 37 tiles left in bag on a 30 by 13 board\nP2 won by"}︡{"stdout":" 1 in 50 rounds with 36 tiles left in bag on a 21 by 19 board\nP1 won by"}︡{"stdout":" 1 in 69 rounds with 17 tiles left in bag on a 29 by 23 board\nP2 won by"}︡{"stdout":" 5 in 70 rounds with 24 tiles left in bag on a 25 by 22 board\nP2 won by"}︡{"stdout":" 1 in 62 rounds with 31 tiles left in bag on a 28 by 19 board\nP1 won by"}︡{"stdout":" 4 in 75 rounds with 15 tiles left in bag on a 27 by 28 board\nP1 won by"}︡{"stdout":" 3 in 65 rounds with 27 tiles left in bag on a 22 by 19 board\nP1 won by"}︡{"stdout":" 3 in 53 rounds with 35 tiles left in bag on a 15 by 19 board\nP1 won by"}︡{"stdout":" 1 in 37 rounds with 43 tiles left in bag on a 21 by 15 board\nP2 won by"}︡{"stdout":" 5 in 38 rounds with 43 tiles left in bag on a 15 by 15 board\nP1 won by"}︡{"stdout":" 3 in 35 rounds with 45 tiles left in bag on a 15 by 20 board\nP2 won by"}︡{"stdout":" 2 in 26 rounds with 49 tiles left in bag on a 17 by 12 board\nP1 won by"}︡{"stdout":" 4 in 27 rounds with 45 tiles left in bag on a 12 by 17 board\nP1 won by"}︡{"stdout":" 1 in 61 rounds with 27 tiles left in bag on a 21 by 35 board\nP2 won by"}︡{"stdout":" 1 in 42 rounds with 43 tiles left in bag on a 24 by 15 board\nP1 won by"}︡{"stdout":" 3 in 39 rounds with 43 tiles left in bag on a 22 by 18 board\nP2 won by"}︡{"stdout":" 4 in 16 rounds with 56 tiles left in bag on a 12 by 14 board\nP1 won by"}︡{"stdout":" 1 in 17 rounds with 56 tiles left in bag on a 11 by 18 board\nP1 won by"}︡{"stdout":" 2 in 63 rounds with 25 tiles left in bag on a 18 by 28 board\nP2 won by"}︡{"stdout":" 1 in 24 rounds with 52 tiles left in bag on a 15 by 18 board\nP2 won by"}︡{"stdout":" 3 in 58 rounds with 28 tiles left in bag on a 27 by 22 board\nP1 won by"}︡{"stdout":" 3 in 25 rounds with 50 tiles left in bag on a 13 by 16 board\nP1 won by"}︡{"stdout":" 3 in 29 rounds with 48 tiles left in bag on a 20 by 20 board\nP1 won by"}︡{"stdout":" 1 in 65 rounds with 24 tiles left in bag on a 18 by 23 board\nP1 won by"}︡{"stdout":" 1 in 57 rounds with 28 tiles left in bag on a 22 by 22 board\nP2 won by"}︡{"stdout":" 8 in 72 rounds with 19 tiles left in bag on a 30 by 17 board\nP1 won by"}︡{"stdout":" 3 in 15 rounds with 57 tiles left in bag on a 13 by 12 board\nP2 won by"}︡{"stdout":" 4 in 28 rounds with 48 tiles left in bag on a 16 by 18 board\nP1 won by"}︡{"stdout":" 1 in 57 rounds with 32 tiles left in bag on a 25 by 24 board\nP1 won by"}︡{"stdout":" 1 in 71 rounds with 24 tiles left in bag on a 26 by 17 board\nP1 won by"}︡{"stdout":" 1 in 19 rounds with 55 tiles left in bag on a 15 by 14 board\nP2 won by"}︡{"stdout":" 2 in 42 rounds with 37 tiles left in bag on a 20 by 18 board\nP1 won by"}︡{"stdout":" 2 in 37 rounds with 41 tiles left in bag on a 14 by 19 board\nP1 won by"}︡{"stdout":" 2 in 33 rounds with 45 tiles left in bag on a 11 by 21 board\nP1 won by"}︡{"stdout":" 1 in 73 rounds with 21 tiles left in bag on a 21 by 20 board\nP1 won by"}︡{"stdout":" 1 in 29 rounds with 50 tiles left in bag on a 15 by 14 board\nP1 won by"}︡{"stdout":" 3 in 55 rounds with 32 tiles left in bag on a 16 by 26 board\nP1 won by"}︡{"stdout":" 1 in 75 rounds with 19 tiles left in bag on a 23 by 27 board\nP1 won by"}︡{"stdout":" 3 in 77 rounds with 14 tiles left in bag on a 29 by 26 board\nP2 won by"}︡{"stdout":" 7 in 50 rounds with 31 tiles left in bag on a 20 by 19 board\nP1 won by"}︡{"stdout":" 2 in 35 rounds with 46 tiles left in bag on a 17 by 15 board\nP2 won by"}︡{"stdout":" 3 in 52 rounds with 34 tiles left in bag on a 20 by 20 board\nP1 won by"}︡{"stdout":" 2 in 65 rounds with 27 tiles left in bag on a 23 by 24 board\nP2 won by"}︡{"stdout":" 3 in 48 rounds with 38 tiles left in bag on a 16 by 20 board\nP2 won by"}︡{"stdout":" 4 in 50 rounds with 38 tiles left in bag on a 15 by 19 board\nP2 won by"}︡{"stdout":" 2 in 18 rounds with 55 tiles left in bag on a 12 by 14 board\nP2 won by"}︡{"stdout":" 1 in 44 rounds with 38 tiles left in bag on a 17 by 16 board\nP2 won by"}︡{"stdout":" 2 in 78 rounds with 17 tiles left in bag on a 26 by 23 board\nP2 won by"}︡{"stdout":" 1 in 38 rounds with 42 tiles left in bag on a 15 by 20 board\ndraw;\n"}︡{"stdout":"\nP1 won by"}︡{"stdout":" 6 in 15 rounds with 55 tiles left in bag on a 11 by 11 board\ndraw"}︡{"stdout":"\nP1 won by"}︡{"stdout":" 4 in 21 rounds with 52 tiles left in bag on a 10 by 16 board\nP1 won by 1 in 15 rounds with 58 tiles left in bag on a 14 by 10 board\nP2 won by"}︡{"stdout":" 1 in 64 rounds with 27 tiles left in bag on a 27 by 19 board\nP1 won by"}︡{"stdout":" 2 in 63 rounds with 26 tiles left in bag on a 19 by 24 board\nP1 won by"}︡{"stdout":" 2 in 43 rounds with 37 tiles left in bag on a 20 by 22 board\nP1 won by"}︡{"stdout":" 4 in 45 rounds with 39 tiles left in bag on a 20 by 23 board\nP2 won by"}︡{"stdout":" 5 in 36 rounds with 41 tiles left in bag on a 14 by 20 board\nP1 won by"}︡{"stdout":" 2 in 47 rounds with 36 tiles left in bag on a 19 by 20 board\nP1 won by"}︡{"stdout":" 2 in 65 rounds with 26 tiles left in bag on a 21 by 23 board\nP1 won by"}︡{"stdout":" 2 in 65 rounds with 27 tiles left in bag on a 22 by 19 board\nP1 won by"}︡{"stdout":" 2 in 51 rounds with 33 tiles left in bag on a 13 by 26 board\nP2 won by"}︡{"stdout":" 1 in 42 rounds with 41 tiles left in bag on a 16 by 17 board\nP1 won by"}︡{"stdout":" 2 in 19 rounds with 55 tiles left in bag on a 14 by 14 board\nP2 won by"}︡{"stdout":" 1 in 56 rounds with 33 tiles left in bag on a 23 by 26 board\nP2 won by"}︡{"stdout":" 1 in 36 rounds with 44 tiles left in bag on a 16 by 16 board\nP2 won by"}︡{"stdout":" 3 in 32 rounds with 47 tiles left in bag on a 20 by 11 board\nP1 won by"}︡{"stdout":" 5 in 15 rounds with 56 tiles left in bag on a 13 by 11 board\nP2 won by"}︡{"stdout":" 2 in 68 rounds with 17 tiles left in bag on a 19 by 25 board\nP1 won by"}︡{"stdout":" 6 in 27 rounds with 48 tiles left in bag on a 16 by 19 board\nP2 won by"}︡{"stdout":" 2 in 26 rounds with 49 tiles left in bag on a 17 by 13 board\nP1 won by"}︡{"stdout":" 3 in 69 rounds with 20 tiles left in bag on a 28 by 19 board\nP2 won by"}︡{"stdout":" 3 in 48 rounds with 38 tiles left in bag on a 17 by 22 board\nP2 won by"}︡{"stdout":" 2 in 66 rounds with 25 tiles left in bag on a 23 by 27 board\nP1 won by"}︡{"stdout":" 2 in 29 rounds with 46 tiles left in bag on a 17 by 17 board\nP2 won by"}︡{"stdout":" 3 in 32 rounds with 44 tiles left in bag on a 19 by 17 board\nP2 won by"}︡{"stdout":" 4 in 22 rounds with 51 tiles left in bag on a 16 by 13 board\nP1 won by"}︡{"stdout":" 3 in 27 rounds with 48 tiles left in bag on a 14 by 20 board\nP1 won by"}︡{"stdout":" 1 in 69 rounds with 25 tiles left in bag on a 28 by 19 board\nP2 won by"}︡{"stdout":" 3 in 58 rounds with 30 tiles left in bag on a 16 by 24 board\nP1 won by"}︡{"stdout":" 3 in 41 rounds with 37 tiles left in bag on a 21 by 20 board\nP1 won by"}︡{"stdout":" 7 in 35 rounds with 42 tiles left in bag on a 15 by 17 board\nP2 won by"}︡{"stdout":" 2 in 20 rounds with 55 tiles left in bag on a 15 by 12 board\ndraw;\n"}︡{"stdout":"\nP2 won by"}︡{"stdout":" 2 in 102 rounds with 3 tiles left in bag on a 29 by 25 board\nP1 won by"}︡{"stdout":" 3 in 47 rounds with 36 tiles left in bag on a 21 by 17 board\nP1 won by"}︡{"stdout":" 2 in 79 rounds with 16 tiles left in bag on a 24 by 25 board\nP2 won by"}︡{"stdout":" 3 in 22 rounds with 52 tiles left in bag on a 12 by 16 board\nP1 won by"}︡{"stdout":" 1 in 63 rounds with 31 tiles left in bag on a 24 by 21 board\nP1 won by"}︡{"stdout":" 1 in 29 rounds with 49 tiles left in bag on a 21 by 13 board\nP1 won by"}︡{"stdout":" 2 in 67 rounds with 29 tiles left in bag on a 20 by 24 board\nP1 won by"}︡{"stdout":" 3 in 43 rounds with 42 tiles left in bag on a 11 by 27 board\nP2 won by"}︡{"stdout":" 4 in 72 rounds with 19 tiles left in bag on a 18 by 27 board\nP1 won by"}︡{"stdout":" 2 in 67 rounds with 26 tiles left in bag on a 22 by 26 board\nP1 won by"}︡{"stdout":" 5 in 39 rounds with 41 tiles left in bag on a 16 by 16 board\nP1 won by"}︡{"stdout":" 4 in 25 rounds with 50 tiles left in bag on a 15 by 13 board\nP1 won by"}︡{"stdout":" 2 in 93 rounds with 5 tiles left in bag on a 31 by 29 board\nP2 won by"}︡{"stdout":" 5 in 34 rounds with 43 tiles left in bag on a 19 by 13 board\nP1 won by"}︡{"stdout":" 2 in 51 rounds with 32 tiles left in bag on a 23 by 19 board\nP2 won by"}︡{"stdout":" 1 in 60 rounds with 24 tiles left in bag on a 26 by 17 board\nP1 won by"}︡{"stdout":" 4 in 37 rounds with 43 tiles left in bag on a 11 by 23 board\nP1 won by"}︡{"stdout":" 2 in 17 rounds with 55 tiles left in bag on a 12 by 13 board\nP2 won by"}︡{"stdout":" 2 in 64 rounds with 31 tiles left in bag on a 16 by 22 board\nP1 won by"}︡{"stdout":" 3 in 35 rounds with 43 tiles left in bag on a 16 by 16 board\nP1 won by"}︡{"stdout":" 1 in 41 rounds with 42 tiles left in bag on a 23 by 17 board\nP2 won by"}︡{"stdout":" 3 in 28 rounds with 49 tiles left in bag on a 14 by 19 board\nP2 won by"}︡{"stdout":" 4 in 42 rounds with 41 tiles left in bag on a 25 by 11 board\nP1 won by"}︡{"stdout":" 1 in 45 rounds with 40 tiles left in bag on a 19 by 20 board\nP2 won by"}︡{"stdout":" 2 in 66 rounds with 25 tiles left in bag on a 23 by 20 board\nP2 won by"}︡{"stdout":" 1 in 44 rounds with 37 tiles left in bag on a 18 by 22 board\nP1 won by"}︡{"stdout":" 1 in 37 rounds with 42 tiles left in bag on a 18 by 21 board\nP1 won by"}︡{"stdout":" 1 in 61 rounds with 28 tiles left in bag on a 18 by 25 board\nP2 won by"}︡{"stdout":" 1 in 22 rounds with 53 tiles left in bag on a 12 by 17 board\nP1 won by"}︡{"stdout":" 1 in 51 rounds with 38 tiles left in bag on a 19 by 21 board\nP1 won by"}︡{"stdout":" 1 in 63 rounds with 29 tiles left in bag on a 34 by 20 board\nP2 won by"}︡{"stdout":" 1 in 34 rounds with 46 tiles left in bag on a 13 by 22 board\nP2 won by"}︡{"stdout":" 3 in 56 rounds with 29 tiles left in bag on a 20 by 19 board\nP2 won by"}︡
︠941a3fe1-1804-42cd-b60a-49fecc405e21︠
︡77d74dc3-7dc2-40d5-9ea4-10f51465d2cd︡
︠df190da6-f685-42e9-8152-ac2ffe8bad46︠









