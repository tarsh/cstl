P_NAME          :=  teststl
P_C_SRCS        :=  $(wildcard *.c)
P_CXX_SRCS      :=  $(wildcard *.cpp)
P_C_OBJS        :=  ${P_C_SRCS:.c=.o}
P_CXX_OBJS      :=  ${P_CXX_SRCS:.cpp=.o}
P_OBJS          :=  $(P_C_OBJS) $(P_CXX_OBJS)
CPPFLAGS        +=  $(foreach includedir,$(P_INCLUDE_DIRS),-I$(includedir))
LDFLAGS         +=  $(foreach librarydir,$(P_LIBRARY_DIRS),-L$(librarydir))
LDFLAGS         +=  $(foreach library,$(P_LIBRARIES),-l$(library))
CXX             :=  gcc
CC              :=  gcc -g
CXXFLAGS        :=  -Wall -g

.PHONY:         all clean
all:            $(P_NAME)
$(P_NAME):      $(P_OBJS)
		  $(CXX) $(CXXFLAGS) $(CPPFLAGS) $(P_OBJS) -o $(P_NAME) $(LDFLAGS)
clean:
	@- $(RM) $(P_NAME)
	@- $(RM) $(P_OBJS)
	@- $(RM) core*

