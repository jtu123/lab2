CC = gcc
CFLAGS = -Wall -Wextra -g -O0
LIBSRC = lib/add.c lib/subtract.c lib/multiply.c lib/divide.c
OBJ = $(LIBSRC:.c=.o)
PICOBJ = $(LIBSRC:.c=.pic.o)
PGOBJ = $(LIBSRC:.c=.pg.o)

.PHONY: all run profile clean
all: calc_static calc_shared calc_dynamic

lib/%.o: lib/%.c lib/calc.h
	$(CC) $(CFLAGS) -c $< -o $@

lib/%.pic.o: lib/%.c lib/calc.h
	$(CC) $(CFLAGS) -fPIC -c $< -o $@

lib/%.pg.o: lib/%.c lib/calc.h
	$(CC) $(CFLAGS) -pg -c $< -o $@

lib/libcalc.a: $(OBJ)
	ar rcs $@ $^

lib/libcalc.so: $(PICOBJ)
	$(CC) -shared -o $@ $^

lib/libcalc_pg.a: $(PGOBJ)
	ar rcs $@ $^

main.o: main.c lib/calc.h
	$(CC) $(CFLAGS) -Ilib -c $< -o $@

calc_static: main.o lib/libcalc.a
	$(CC) $(CFLAGS) -o $@ main.o lib/libcalc.a

calc_shared: main.o lib/libcalc.so
	$(CC) $(CFLAGS) -o $@ main.o -Llib -lcalc -Wl,-rpath,'$$ORIGIN/lib'

calc_dynamic: main_dynamic.c lib/libcalc.so
	$(CC) $(CFLAGS) -o $@ main_dynamic.c -ldl

calc_profile: main.c lib/calc.h lib/libcalc_pg.a
	$(CC) $(CFLAGS) -pg -Ilib main.c lib/libcalc_pg.a -o $@

profile: calc_profile

run: all
	./calc_static
	./calc_shared
	./calc_dynamic

clean:
	rm -f main.o lib/*.o lib/*.a lib/*.so
	rm -f calc_static calc_shared calc_dynamic calc_profile gmon.out

