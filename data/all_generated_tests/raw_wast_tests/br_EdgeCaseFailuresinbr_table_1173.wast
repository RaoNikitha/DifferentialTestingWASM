;; 4. Provide a `br_table` instruction with an index that is one greater than the number of available targets to test proper behavior when the index exceeds bounds, ensuring a fall-back to the default label without undefined behavior.

(assert_invalid
  (module
    (func $br-table-test
      (block (block 
        (br_table 0 1 2 (i32.const 3))
      ))
    )
  )
  "unknown default label"
)