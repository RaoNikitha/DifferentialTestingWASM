;; 2. **Test Unreachable in `else` Block Without Init**:    - Craft an `if` instruction with the `unreachable` instruction only in the `else` block. The true condition should not alter the program flow but verify if reaching `else` erroneously triggers `unreachable` due to missing init.

(assert_invalid
  (module (func $unreachable-else (result i32)
    (if (result i32) (i32.const 1)
      (then (i32.const 1))
      (else (unreachable))
    )
  ))
  "type mismatch"
)