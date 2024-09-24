(assert_malformed
  (module
    (type $0 (func))
    (import "env" "nested_func" (func $0 (type 0)))
    (func $1 (type 0) (nop) (call 0) (nop) (call 0) (nop) (call 0))
  )
""
)