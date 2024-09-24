;; 7. Test an infinite loop that conditionally breaks with `br_if` followed by a series of no-op instructions. If the engine miscounts stack references, these no-ops might cause an indefinite loop.

(assert_invalid
  (module (func $infinite-loop-conditional-break
    (block (loop 
      (br_if 1 (i32.const 1))
      (nop)
    ))
  ))
  "infinite loop detection"
)