;; Test a `loop` block with a `br_table` including an index that refers to a loop that iterates no times, ensuring both implementations handle this zero-iteration case correctly without falling into unintended infinite loops or crashes.

(assert_invalid
  (module
    (func $loop-br_table-zero-iter
      (block
        (loop $L (br_table 0 $L))
      )
    )
  )
  "type mismatch"
)