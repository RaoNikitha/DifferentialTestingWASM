;; 3. Implement a nested loop structure where inner loops contain `br_if` branches based on external variable conditions. Validate that only inner loops references correctly follow branch conditions, maintaining stack integrity.

(assert_invalid
  (module (func $nested-loop-br_if
    (local i32)  ;; External variable condition
    (loop (result i32)
      (block (loop (result i32)
        (i32.const 1)
        (local.get 0)
        (br_if 1)
        (nop)
        (br 0)
      ))
      (br 0)
    )
  ))
  "type mismatch"
)