;; 2. **Test Description:**    Check behavior when an imported function is called, and during its execution, it contains a `br` instruction targeting a `loop` that results in a backward jump within the imported function. Ensure the control flow resumes correctly after the loop within the calling module.

(assert_invalid
  (module
    (import "env" "external_func" (func $external_func)
    (func 
      (block $B1 (loop $L1 
        (call $external_func)
        (br $L1)
      ))
    )
  )
  "unknown label"
)