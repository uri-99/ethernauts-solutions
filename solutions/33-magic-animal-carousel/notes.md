

    mapping(uint256 crateId => uint256 animalInside) public carousel;

the animal uint256 bit packing seems to be the following:

                            256 bits
|-------------------|------------------------|--------------------|
 OWNER (160 bits)        NEXT_ID (16 bits)       ANIMAL (80 bits)
 (bits 0-159)            (Bits 160-175)          (Bits 176-255)
|-------------------|------------------------|--------------------|
or better yet, 
0x......
|--------------------|------------------------|-------------------|
 ANIMAL (80 bits)        NEXT_ID (16 bits)        OWNER (160 bits)
 (Bits 176-255)          (Bits 160-175)           (bits 0-159)
|--------------------|------------------------|-------------------|


I must:
1) setAnimalAndSpin()
2) changeAnimal()
    such that the same animal is no longer there.

lets go through the proceses:

"setAnimalAndSpin("cat")
-> encodeAnimalName("cat") -> 