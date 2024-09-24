;; 4. Scenario with multiple `br_if` instructions in a sequence, each conditionally based on alternating zero and non-zero values. The test ensures the branching behavior aligns correctly with the specified condition each time.

(assert_invalid
  (module
    (func $multiple-br_if (result i32)
      (block $label0 (result i32)
        (br_if 0 (i32.const 0)) 
        (i32.const 1)
        (block $label1 (result i32)
          (br_if 0 (i32.const 1)) 
          (drop (i32.const 2))
        )
      )
    )
  )
  "type mismatch"
)