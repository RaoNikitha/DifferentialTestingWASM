;; 6. Create a scenario where a `call` instruction sets up the stack for a `br_table` instruction which utilizes the max index value. This tests whether an off-by-one handling in either implementation results in differing behavior, highlighting any subtle differences in index bounds checking.

(assert_invalid
  (module
    (type (func (param i32)))
    (func $setup-stack (param i32)
      local.get 0
      call 0)
    (func $max-index (param i32) 
      local.get 0
      br_table 4294967295))
  "unknown function"
)