;; 8. Write a function that has `nop` before a `call_indirect` which conditionally jumps to different functions. Validate the correct function is called based on the condition, ensuring `nop` does not interfere with the indirect call logic.

 ;; (module
  (table 1 funcref)
  (type $t (func))
  (func $f1 (nop) (call_indirect (type $t) (i32.const 0)))
  (elem (i32.const 0) $f1)
)