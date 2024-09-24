;; 3. **Test Description**:    Create a block with an invalid function type index as the block type. Check whether the environment can properly handle this invalid index and prevent stack corruption by rejecting the instruction. This will test the proper functioning of block type validation and its effect on stack operations.

(assert_invalid
  (module (func (block (type 99) (nop)) ))
  "type index out of bounds"
)