Getter __FILE__ do

  setup \
    base: :commits,
    fields: [:hash, :time, :status, :message],
    order: [ [field('time').cast(:timestamp), false] ],
    limit: 10,

    scope: ->(ds, params){ ds.where(field('status')=>'accepted') }

end
