;; 6. **Test 6:** Use `br_table` with nested blocks as targets and insert `unreachable` in each block. Examine if the execution traps instantly upon hitting `unreachable` without jumping to any block given by `br_table`.

(assert_invalid
  (module
    (func (block 
      (br_table 0 0 
        (block (unreachable)) 
        (block (unreachable))
      )
    ))
  )
  "type mismatch"
)