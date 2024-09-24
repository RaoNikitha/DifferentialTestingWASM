;; 3. **Test Description:**     A `br_table` instruction targeting multiple labels where one of the indexed paths includes an `unreachable` instruction directly after a valid branch, to test conditional trapping.    **Constraint Checked:** Checks if reaching the `unreachable` instruction via a valid path from `br_table` causes consistent trapping.    **Edge Case Relation:** Evaluates if all potential branches from `br_table` correctly manage traps due to `unreachable`.

(assert_invalid
  (module (func $conditional_trap_via_br_table (param i32) (result i32)
    (block (result i32) 
      (block (result i32) 
        (br_table 0 (unreachable) (i32.const 1)) (f32.const 0)
      )
    )
  ))
  "type mismatch"
)