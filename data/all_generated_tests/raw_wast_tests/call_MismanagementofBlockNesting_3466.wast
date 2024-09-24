;; 5. **Function Calls within Loops Exiting via `br_table`**:    - Call functions within a loop that is exited by a `br_table` instruction. Check if the correct block is exited.    - Validate correct stack handling and index lookup during complex flow changes.

(assert_invalid
 (module
  (func $test
   (block
    (loop
     (call 1)
     (br_table 0 1 (i32.const 0))
    )
   )
  )
  (func (param))
 )
 "type mismatch"
)