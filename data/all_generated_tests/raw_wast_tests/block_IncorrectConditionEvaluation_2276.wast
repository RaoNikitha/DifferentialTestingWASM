;; 7. Create a block instruction involving memory load operations followed by a `br_if` checking equality of loaded values. This test ensures that memory access followed by condition evaluation and branching works as intended.

(assert_invalid
  (module
    (memory 1)
    (func (result i32)
      (i32.const 0) 
      (i32.load offset=0 align=4) 
      (i32.const 4) 
      (i32.load offset=0 align=4) 
      (i32.eq)
      (block (result i32) 
        (br_if 0))) 
  )
  "type mismatch"
)