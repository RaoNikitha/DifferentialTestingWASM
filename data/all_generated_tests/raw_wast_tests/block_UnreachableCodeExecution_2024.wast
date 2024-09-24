;; 5. **Test Description**:    Generate a series of blocks with multiple instructions that eventually lead to a `br` instruction targeting an `unreachable` block. This examines the control flow and whether each implementation traps when reaching an `unreachable` after several valid instructions.

(assert_invalid
  (module (func $unreachable-br (result i32)
    (block (result i32) 
      (i32.const 1)
      (i32.const 2)
      (i32.add)
      (block (result i32) 
        (i32.const 3) 
        (block (result i32)
          (unreachable)
	  (br 0 (i32.const 4))
        )
      )
    )
  ))
  "unreachable executed"
)