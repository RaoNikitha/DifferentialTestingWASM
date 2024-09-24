;; 4. Form a loop containing a `br_table` with an index just above the boundary and an `unreachable` instruction inside. Verify if both WebAssembly and Wizard Engine trap at the `br_table` boundary exceeding index correctly.

(assert_invalid
  (module (func $test
    (loop $loop
      (block (br_table 1 (unreachable) (i32.const 0)))
    )
  ))
  "type mismatch"
)