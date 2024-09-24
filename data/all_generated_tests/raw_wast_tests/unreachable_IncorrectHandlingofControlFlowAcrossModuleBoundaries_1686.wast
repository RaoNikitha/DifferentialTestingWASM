;; 7. Simulate a complex call graph with mixed direct and indirect function calls, ensuring that `unreachable` instruction in any of these functions immediately traps and properly communicates the trap state across module boundaries.

(assert_invalid
  (module
    (type $t0 (func (result i32)))
    (type $t1 (func))
    (import "env" "external_func" (func $external_func (param i32 i32) (result i32)))
    (func $func_with_unreachable (param $p0 i32) (result i32)
      (block
        (block
          (br 1)
          (unreachable)
        )
        (call_indirect (type $t0) (i32.const 0))
      )
      (i32.const 0)
    )
    (elem (i32.const 0) $external_func)
    (table 1 funcref)
    (memory 1)
    (export "memory" (memory 0))
  )
  "type mismatch"
)