;; 3. Create a sequence where a `nop` instruction is followed by a logical condition check (e.g., equality or inequality comparison) preceding a `br_if`. Ensure the condition's outcome is correctly evaluated independent of the `nop`.

(assert_malformed
  (module
    (func $test
      (i32.const 1)
      nop
      (i32.eqz)
      (br_if 0))
  )
  "unexpected token"
)