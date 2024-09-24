;; 7. Test a chain of `block` instructions with br_table that always end up executing an `unreachable` instruction, ensuring proper trap handling by the environment.

(assert_invalid
  (module
    (func $type-br-table-unreachable-chain
      (block (block (block 
        (br_table 0 1 2 (i32.const 0)) 
        (unreachable)
        (unreachable)
      )))
    )
  )
  "type mismatch"
)