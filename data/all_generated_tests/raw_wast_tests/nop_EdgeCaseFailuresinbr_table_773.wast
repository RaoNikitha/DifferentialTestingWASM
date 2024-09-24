;; 4. Implement a nested control structure with several `nop` instructions, followed by `br_table` where the index value is equal to `-1`. Ensure consistent error handling in WebAssembly and wizard_engine while ensuring `nop` has no incidental effect.

(assert_invalid
  (module
    (func (block (loop (if
      (then (nop) (nop) (br_table 0 1 2 -1)))))
    )
  )
  "index out of range"
)