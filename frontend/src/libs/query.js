const access_token = "4721F803B60B0F8A450091E73F4D22207B96A32383B4B0398BB43F66752352FD"

export const GET = async(url, params={}) => {

  let strParams = Object.keys(params).map(key => (key+"="+params[key])).join("&")
  if(strParams) strParams = "?"+strParams

  const response = await fetch(url+strParams, {
    headers: {
      'Authorization': 'Bearer '+access_token
    }
  });

  const json = await response.json();

  if(json.data) return json.data

  return json;
}


export const REST = async (url, body, method) => {

  const response = await fetch(url, {
    method: method || 'POST',
    body: JSON.stringify(body),
    headers: {
     'Content-Type': 'application/json;charset=utf-8',
     'Authorization': 'Bearer '+access_token
    }
  });

  try{
    const json = await response.json();
    return json;
  }catch(e){
  
    return { error: "Response is not a valid JSON" }
  }
}