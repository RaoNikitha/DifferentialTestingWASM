;; 4. Define a table with several entries and use `call_indirect` to call a function that includes a branch instruction targeting an invalid nested loop. This test checks whether the Java implementation can detect and handle incorrect nested branch targets efficiently.

(assert_invalid
  (module
    (type (func))
    (table funcref 
      (elem 1 2))
    (func $nested-loop
      (loop
        (block
          (br 2))
      )
    )
    (func (call_indirect (type 0) (i32.const 0)))
  )
  "invalid branch target"
)