view: cfips_location {
 sql_table_name: `finance_data.cfips_location`
      ;;


  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: cfips {
    type: number
    sql: ${TABLE}.cfips ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: lng {
    type: number
    sql: ${TABLE}.lng ;;
  }

  dimension: lat {
    type: number
    sql: ${TABLE}.lat ;;
  }

  dimension: location {
    type: location
    sql_latitude: ${TABLE}.lat ;;
    sql_longitude: ${TABLE}.lng ;;
  }

  set: detail {
    fields: [cfips, name, lng, lat, location]
  }

  measure: is_cfips_over_50000 {
    type: string
    sql: case  when ${TABLE}.cfips > 50000 then "is above 5000" else "is below 50000" end ;;
  }

}
