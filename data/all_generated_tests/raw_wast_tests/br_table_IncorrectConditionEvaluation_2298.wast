;; Test 8: Create a function with `br_table` that uses operands dynamically calculated within the stack and observe if branches are correctly evaluated when conditions are runtime-determined. This test checks for dynamic condition evaluation and consistent control flow modifications.

(assert_invalid
  (module
    (func
      (block $loop (loop $continue
        (i32.const 1)  ;; Operand for br_table should generally be non-zero for branching
        (br_table $continue (i32.const 2)) ;; Dynamically determining the operand would happen here
      ))
    )
  )
  "type mismatch"
)