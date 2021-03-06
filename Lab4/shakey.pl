
%   Blocks World

%  To run this example, first consult the planner you want to use
%  (strips.pl or idstrips.pl) and then consult the blocks.pl example
%  In the query window, run the goal:
%  ?- plan.


% Action_Move_From_Room_To_Room
act( move(FromRoom, ToRoom),                                                    % action name
     [shakey(S), room(FromRoom), room(ToRoom), in(S, FromRoom),  on(S,floor), connect(FromRoom,ToRoom)],      % preconditions
     [in(S,FromRoom)],                                                          % delete
     [in(S,ToRoom)]                                                              % add
     ).

% Action_Climb_Boxes
act( climbUp(Box),
     [shakey(S), box(Box), on(S,floor), in(S,Room), in(Box,Room) ],
     [ on(S,floor)],
     [ on(S,Box)]
     ).

act( climbDown(Box),
     [shakey(S), box(Box), on(S,Box), in(S,Pos), in(Box,Pos)],
     [ on(S,Box)],
     [ on(S,floor)]
     ).

% Action_Move_Box_From_Room_To_Room
act( pushBox(Box, PosA, PosB),
     [shakey(S), box(Box), on(S,floor), in(S,PosA), in(Box, PosA), connect(PosA, PosB)],
     [in(S,PosA), in(Box, PosA)],
     [in(S,PosB), in(Box, PosB)]
     ).

% Action_Light_Switches
act( switchOn(),
     [shakey(S), box(Box), switch(L,false), in(Box,L), in(S,L), on(S, Box) ],
     [switch(L,false)],
     [switch(L,true)]
     ).

act( switchOff(),
     [shakey(S), box(Box), switch(L,true), in(Box,L), in(S,L), on(S, Box) ],
     [switch(L,true)],
     [switch(L,false)]
     ).

% Find_Plans_For_Goals
goal_state(
    [
        in(s, room1),
        switch(light1, false),
        in(box2, room2)
    ]).

initial_state(
    [
     % Shakey
        shakey(s),
        in(s, room3),
        on(s, floor),

     % Rooms
        room(room1),
        room(room2),
        room(room3),
        room(room4),

     % Boxes
        box(box1),
        box(box2),
        box(box3),
        box(box4),
        
     % Boxes_Location
        in(box1, room1),
        in(box2, room1),
        in(box3, room1),
        in(box4, room1),

     % Light_Switches
        switch(light1, true),
        switch(light2, false),
        switch(light3, false),
        switch(light4, true),
        
     % Light_Switches_Location
        in(light1, room1),
        in(light2, room2),
        in(light3, room3),
        in(light4, room4),

     % Connections
        connect(room1, corridor),
        connect(room2, corridor),
        connect(room3, corridor),
        connect(room4, corridor),

        connect(corridor, room1),
        connect(corridor, room2),
        connect(corridor, room3),
        connect(corridor, room4),

        connect(room1, light1),
        connect(room2, light2),
        connect(room3, light3),
        connect(room4, light4),

        connect(light1, room1),
        connect(light2, room2),
        connect(light3, room3),
        connect(light4, room4)

    ]).