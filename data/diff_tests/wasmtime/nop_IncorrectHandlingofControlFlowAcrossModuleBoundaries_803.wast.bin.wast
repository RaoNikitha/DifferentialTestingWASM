(assert_malformed
  (module
    (type $0 (func))
    (import "env" "externalFunc" (func $0 (type 0)))
    (func $1 (type 0) (loop (nop) (call 0) (br 0)) (nop))
    (export "test" (func 1))
  )
""
)